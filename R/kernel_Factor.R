#' Factor Kernel R6 class
#'
#' For a factor that has been converted to its indices.
#' Each factor will need a separate kernel.
#'
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @useDynLib GauPro, .registration = TRUE
#' @importFrom Rcpp evalCpp
#' @importFrom stats optim
# @keywords data, kriging, Gaussian process, regression
#' @return Object of \code{\link[R6]{R6Class}} with methods for fitting GP model.
#' @format \code{\link[R6]{R6Class}} object.
#' @field p Parameter for correlation
#' @field p_est Should p be estimated?
#' @field p_lower Lower bound of p
#' @field p_upper Upper bound of p
#' @field p_length length of p
#' @field s2 variance
#' @field s2_est Is s2 estimated?
#' @field logs2 Log of s2
#' @field logs2_lower Lower bound of logs2
#' @field logs2_upper Upper bound of logs2
#' @field xindex Index of the factor (which column of X)
#' @field nlevels Number of levels for the factor
#' @field offdiagequal What should offdiagonal values be set to when the
#' indices are the same? Use to avoid decomposition errors, similar to
#' adding a nugget.
#' @examples
#' kk <- FactorKernel$new(D=1, nlevels=5, xindex=1)
#' kk$p <- (1:10)/100
#' kmat <- outer(1:5, 1:5, Vectorize(kk$k))
#' kmat
#' kk$plot()
#'
#'
#' # 2D, Gaussian on 1D, index on 2nd dim
#' if (requireNamespace("dplyr", quietly=TRUE)) {
#' library(dplyr)
#' n <- 20
#' X <- cbind(matrix(runif(n,2,6), ncol=1),
#'            matrix(sample(1:2, size=n, replace=TRUE), ncol=1))
#' X <- rbind(X, c(3.3,3))
#' n <- nrow(X)
#' Z <- X[,1] - (X[,2]-1.8)^2 + rnorm(n,0,.1)
#' tibble(X=X, Z) %>% arrange(X,Z)
#' k2a <- IgnoreIndsKernel$new(k=Gaussian$new(D=1), ignoreinds = 2)
#' k2b <- FactorKernel$new(D=2, nlevels=3, xind=2)
#' k2 <- k2a * k2b
#' k2b$p_upper <- .65*k2b$p_upper
#' gp <- GauPro_kernel_model$new(X=X, Z=Z, kernel = k2, verbose = 5,
#'                               nug.min=1e-2, restarts=0)
#' gp$kernel$k1$kernel$beta
#' gp$kernel$k2$p
#' gp$kernel$k(x = gp$X)
#' tibble(X=X, Z=Z, pred=gp$predict(X)) %>% arrange(X, Z)
#' tibble(X=X[,2], Z) %>% group_by(X) %>% summarize(n=n(), mean(Z))
#' curve(gp$pred(cbind(matrix(x,ncol=1),1)),2,6, ylim=c(min(Z), max(Z)))
#' points(X[X[,2]==1,1], Z[X[,2]==1])
#' curve(gp$pred(cbind(matrix(x,ncol=1),2)), add=TRUE, col=2)
#' points(X[X[,2]==2,1], Z[X[,2]==2], col=2)
#' curve(gp$pred(cbind(matrix(x,ncol=1),3)), add=TRUE, col=3)
#' points(X[X[,2]==3,1], Z[X[,2]==3], col=3)
#' legend(legend=1:3, fill=1:3, x="topleft")
#' # See which points affect (5.5, 3 themost)
#' data.frame(X, cov=gp$kernel$k(X, c(5.5,3))) %>% arrange(-cov)
#' plot(k2b)
#' }
#'
# FactorKernel ----
FactorKernel <- R6::R6Class(
  classname = "GauPro_kernel_FactorKernel",
  inherit = GauPro_kernel,
  public = list(
    p = NULL, # vector of correlations
    p_est = NULL,
    p_lower = NULL,
    p_upper = NULL,
    p_length = NULL,
    s2 = NULL, # variance coefficient to scale correlation matrix to covariance
    s2_est = NULL,
    logs2 = NULL,
    logs2_lower = NULL,
    logs2_upper = NULL,
    nlevels = NULL,
    xindex = NULL,
    offdiagequal = NULL,
    #' @description Initialize kernel object
    #' @param s2 Initial variance
    #' @param D Number of input dimensions of data
    #' @param p_lower Lower bound for p
    #' @param p_upper Upper bound for p
    #' @param p_est Should p be estimated?
    #' @param p Vector of correlations
    #' @param s2_lower Lower bound for s2
    #' @param s2_upper Upper bound for s2
    #' @param s2_est Should s2 be estimated?
    #' @param xindex Index of the factor (which column of X)
    #' @param nlevels Number of levels for the factor
    #' @param useC Should C code used? Not implemented for FactorKernel yet.
    #' @param offdiagequal What should offdiagonal values be set to when the
    #' indices are the same? Use to avoid decomposition errors, similar to
    #' adding a nugget.
    initialize = function(s2=1, D, nlevels, xindex,
                          p_lower=0, p_upper=.9, p_est=TRUE,
                          s2_lower=1e-8, s2_upper=1e8, s2_est=TRUE,
                          p, useC=TRUE, offdiagequal=1-1e-6
    ) {
      # Must give in D
      if (missing(D)) {stop("Must give Index kernel D")}

      self$D <- D
      self$nlevels <- nlevels
      self$xindex <- xindex

      if (missing(p)) {
        p <- rep(0, nlevels * (nlevels-1) / 2)
      } else {
        stopifnot(length(p) == (nlevels * (nlevels-1) / 2))
      }
      self$p <- p
      self$p_length <- length(p)
      self$p_lower <-rep(0, self$p_length)
      # Don't give upper 1 since it will give optimization error
      self$p_upper <-rep(p_upper, self$p_length)

      self$p_est <- p_est
      self$s2 <- s2
      self$logs2 <- log(s2, 10)
      self$logs2_lower <- log(s2_lower, 10)
      self$logs2_upper <- log(s2_upper, 10)
      self$s2_est <- s2_est
      self$useC <- useC

      self$offdiagequal <- offdiagequal
    },
    #' @description Calculate covariance between two points
    #' @param x vector.
    #' @param y vector, optional. If excluded, find correlation
    #' of x with itself.
    #' @param p Correlation parameters.
    #' @param s2 Variance parameter.
    #' @param params parameters to use instead of beta and s2.
    k = function(x, y=NULL, p=self$p, s2=self$s2, params=NULL) {
      if (!is.null(params)) {
        lenparams <- length(params)

        if (self$p_est) {
          p <- params[1:self$p_length]
        } else {
          p <- self$p
        }
        if (self$s2_est) {
          logs2 <- params[lenparams]
        } else {
          logs2 <- self$logs2
        }




        s2 <- 10^logs2
      } else {
        if (is.null(p)) {p <- self$p}
        if (is.null(s2)) {s2 <- self$s2}
      }
      if (is.null(y)) {
        if (is.matrix(x)) {
          val <- outer(1:nrow(x), 1:nrow(x),
                       Vectorize(function(i,j){
                         self$kone(x[i,],x[j,],p=p, s2=s2, isdiag=i==j)
                       }))
          return(val)
        } else {
          return(s2 * 1)
        }
      }
      if (is.matrix(x) & is.matrix(y)) {
        outer(1:nrow(x), 1:nrow(y),
              Vectorize(function(i,j){self$kone(x[i,],y[j,],p=p, s2=s2)}))
      } else if (is.matrix(x) & !is.matrix(y)) {
        apply(x, 1, function(xx) {self$kone(xx, y, p=p, s2=s2)})
      } else if (is.matrix(y)) {
        apply(y, 1, function(yy) {self$kone(yy, x, p=p, s2=s2)})
      } else {
        self$kone(x, y, p=p, s2=s2)
      }
    },
    #' @description Find covariance of two points
    #' @param x vector
    #' @param y vector
    #' @param p correlation parameters on regular scale
    #' @param s2 Variance parameter
    #' @param isdiag Is this on the diagonal of the covariance?
    #' @param offdiagequal What should offdiagonal values be set to when the
    #' indices are the same? Use to avoid decomposition errors, similar to
    #' adding a nugget.
    kone = function(x, y, p, s2, isdiag=TRUE, offdiagequal=self$offdiagequal) {
      x <- x[self$xindex]
      y <- y[self$xindex]
      stopifnot(x>=1, y>=1, x<=self$nlevels, y<=self$nlevels,
                abs(x-as.integer(x)) < 1e-8, abs(y-as.integer(y)) < 1e-8)
      if (all(x == y)) {
        # Trying to avoid singular values
        if (isdiag) {
          out <- s2 * 1
        } else {
          out <- s2 * offdiagequal
        }
      } else {
        # i <- x-1
        # j <- y-1
        i <- min(x-1, y-1)
        j <- max(x-1, y-1)
        n <- self$nlevels
        ind <- (n*(n-1)/2) - (n-i)*((n-i)-1)/2 + j - i #- 1
        out <- s2 * p[ind]
      }
      if (any(is.nan(out))) {stop("Error #928341")}
      out
    },
    #' @description Derivative of covariance with respect to parameters
    #' @param params Kernel parameters
    #' @param X matrix of points in rows
    #' @param C_nonug Covariance without nugget added to diagonal
    #' @param C Covariance with nugget
    #' @param nug Value of nugget
    dC_dparams = function(params=NULL, X, C_nonug, C, nug) {
      # stop("not implemented, kernel index, dC_dp")
      n <- nrow(X)

      lenparams <- length(params)

      if (lenparams > 0) {
        if (self$p_est) {
          p <- params[1:self$p_length]
        } else {
          p <- self$p
        }
        if (self$s2_est) {
          logs2 <- params[lenparams]
        } else {
          logs2 <- self$logs2
        }
      } else {
        p <- self$p
        logs2 <- self$logs2
      }

      log10 <- log(10)
      s2 <- 10 ^ logs2

      if (missing(C_nonug)) { # Assume C missing too, must have nug
        C_nonug <- self$k(x=X, params=params)
        C <- C_nonug + diag(nug*s2, nrow(C_nonug))
      }

      lenparams_D <- self$p_length*self$p_est + self$s2_est
      dC_dparams <- array(dim=c(lenparams_D, n, n), data=0)
      if (self$s2_est) {
        dC_dparams[lenparams_D,,] <- C * log10
      }
      if (self$p_est) {
        for (k in 1:length(p)) { # k is index of parameter
          for (i in seq(1, n-1, 1)) {
            xx <- X[i, self$xindex]
            for (j in seq(i+1, n, 1)) {
              yy <- X[j, self$xindex]
              if (xx == yy) {
                # Corr is just 1, parameter has no effect
              } else {
                ii <- min(xx-1, yy-1)
                jj <- max(xx-1, yy-1)
                nn <- self$nlevels
                ind <- (nn*(nn-1)/2) - (nn-ii)*((nn-ii)-1)/2 + jj - ii #- 1
                # print(c(k, i, j, xx, yy, ii, jj, ind, nn))
                if (ind == k) { # Does correspond to the correct parameter
                  dC_dparams[k,i,j] <- 1 * s2
                  dC_dparams[k,j,i] <- dC_dparams[k,i,j]
                } else {
                  # Parameter has no effect
                }
              }
            }
          }
          for (i in seq(1, n, 1)) { # Get diagonal set to zero
            dC_dparams[k,i,i] <- 0
          }
        }
      }
      return(dC_dparams)
    },
    #' @description Calculate covariance matrix and its derivative
    #'  with respect to parameters
    #' @param params Kernel parameters
    #' @param X matrix of points in rows
    #' @param nug Value of nugget
    C_dC_dparams = function(params=NULL, X, nug) {
      s2 <- self$s2_from_params(params)
      C_nonug <- self$k(x=X, params=params)
      C <- C_nonug + diag(s2*nug, nrow(X))
      dC_dparams <- self$dC_dparams(params=params, X=X, C_nonug=C_nonug,
                                    C=C, nug=nug)
      list(C=C, dC_dparams=dC_dparams)
    },
    #' @description Derivative of covariance with respect to X
    #' @param XX matrix of points
    #' @param X matrix of points to take derivative with respect to
    #' @param ... Additional args, not used
    dC_dx = function(XX, X, ...) {
      if (!is.matrix(XX)) {stop()}
      d <- ncol(XX)
      if (ncol(X) != d) {stop()}
      n <- nrow(X)
      nn <- nrow(XX)
      dC_dx <- array(0, dim=c(nn, d, n))
      dC_dx[, self$xindex, ] <- NA
      dC_dx
    },
    #' @description Starting point for parameters for optimization
    #' @param jitter Should there be a jitter?
    #' @param y Output
    #' @param p_est Is p being estimated?
    #' @param s2_est Is s2 being estimated?
    param_optim_start = function(jitter=F, y, p_est=self$p_est,
                                 s2_est=self$s2_est) {
      if (p_est) {
        vec <- pmin(pmax(self$p + jitter*rnorm(length(self$p), 0, .1),
                         self$p_lower), self$p_upper)
      } else {
        vec <- c()
      }
      if (s2_est) {
        vec <- c(vec, max(min(self$logs2 + jitter * rnorm(1),
                              self$logs2_upper),
                          self$logs2_lower)
        )
      }
      vec
    },
    #' @description Starting point for parameters for optimization
    #' @param jitter Should there be a jitter?
    #' @param y Output
    #' @param p_est Is p being estimated?
    #' @param s2_est Is s2 being estimated?
    param_optim_start0 = function(jitter=F, y, p_est=self$p_est,
                                  s2_est=self$s2_est) {
      if (p_est) {
        vec <- pmin(
          pmax(rep(0, length(self$p)) + jitter*rnorm(length(self$p), 0, .1),
               self$p_lower), self$p_upper)
      } else {
        vec <- c()
      }
      if (s2_est) {
        vec <- c(vec, max(min(self$logs2 + jitter * rnorm(1),
                              self$logs2_upper),
                          self$logs2_lower))
      }
      vec
    },
    #' @description Lower bounds of parameters for optimization
    #' @param p_est Is p being estimated?
    #' @param s2_est Is s2 being estimated?
    param_optim_lower = function(p_est=self$p_est,
                                 s2_est=self$s2_est) {
      if (p_est) {vec <- c(self$p_lower)} else {vec <- c()}
      if (s2_est) {vec <- c(vec, self$logs2_lower)} else {}
      vec
    },
    #' @description Upper bounds of parameters for optimization
    #' @param p_est Is p being estimated?
    #' @param s2_est Is s2 being estimated?
    param_optim_upper = function(p_est=self$p_est,
                                 s2_est=self$s2_est) {
      if (p_est) {vec <- c(self$p_upper)} else {vec <- c()}
      if (s2_est) {vec <- c(vec, self$logs2_upper)} else {}
      vec
    },
    #' @description Set parameters from optimization output
    #' @param optim_out Output from optimization
    #' @param p_est Is p being estimated?
    #' @param s2_est Is s2 being estimated?
    set_params_from_optim = function(optim_out, p_est=self$p_est,
                                     s2_est=self$s2_est) {
      loo <- length(optim_out)
      if (p_est) {
        self$p <- optim_out[1:(self$p_length)]
      }
      if (s2_est) {
        self$logs2 <- optim_out[loo]
        self$s2 <- 10 ^ self$logs2
      }
    },
    #' @description Get s2 from params vector
    #' @param params parameter vector
    #' @param s2_est Is s2 being estimated?
    s2_from_params = function(params, s2_est=self$s2_est) {
      # 10 ^ params[length(params)]
      if (s2_est && !is.null(params)) { # Is last if in params
        10 ^ params[length(params)]
      } else { # Else it is just using set value, not being estimated
        self$s2
      }
    },
    #' @description Print this object
    print = function() {
      cat('GauPro kernel: Factor\n')
      cat('\tD  =', self$D, '\n')
      cat('\ts2 =', self$s2, '\n')
      cat('\ton x-index', self$xindex, 'with', self$nlevels, 'levels\n')
    }
  )
)

#' @rdname FactorKernel
#' @export
#' @description Initialize kernel object
#' @param s2 Initial variance
#' @param D Number of input dimensions of data
#' @param p_lower Lower bound for p
#' @param p_upper Upper bound for p
#' @param p_est Should p be estimated?
#' @param p Vector of correlations
#' @param s2_lower Lower bound for s2
#' @param s2_upper Upper bound for s2
#' @param s2_est Should s2 be estimated?
#' @param xindex Index of the factor (which column of X)
#' @param nlevels Number of levels for the factor
#' @param useC Should C code used? Not implemented for FactorKernel yet.
#' @param offdiagequal What should offdiagonal values be set to when the
#' indices are the same? Use to avoid decomposition errors, similar to
#' adding a nugget.
k_FactorKernel <- function(s2=1, D, nlevels, xindex,
                           p_lower=0, p_upper=.9, p_est=TRUE,
                           s2_lower=1e-8, s2_upper=1e8, s2_est=TRUE,
                           p, useC=TRUE, offdiagequal=1-1e-6) {
  FactorKernel$new(
    s2=s2,
    D=D,
    nlevels=nlevels,
    xindex=xindex,
    p_lower=p_lower,
    p_upper=p_upper,
    p_est=p_est,
    s2_lower=s2_lower,
    s2_upper=s2_upper,
    s2_est=s2_est,
    p=p,
    useC=useC,
    offdiagequal=offdiagequal
  )
}
