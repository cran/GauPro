% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kernel_model_LOO.R
\docType{class}
\name{GauPro_kernel_model_LOO}
\alias{GauPro_kernel_model_LOO}
\title{Corr Gauss GP using inherited optim}
\format{
\code{\link{R6Class}} object.
}
\value{
Object of \code{\link{R6Class}} with methods for fitting GP model.
}
\description{
Corr Gauss GP using inherited optim

Corr Gauss GP using inherited optim
}
\examples{
n <- 12
x <- matrix(seq(0,1,length.out = n), ncol=1)
y <- sin(2*pi*x) + rnorm(n,0,1e-1)
gp <- GauPro_kernel_model_LOO$new(X=x, Z=y, kernel=Gaussian)
y <- x^2 * sin(2*pi*x) + rnorm(n,0,1e-3)
gp <- GauPro_kernel_model_LOO$new(X=x, Z=y, kernel=Matern52)
y <- exp(-1.4*x)*cos(7*pi*x/2)
gp <- GauPro_kernel_model_LOO$new(X=x, Z=y, kernel=Matern52)
}
\section{Super class}{
\code{\link[GauPro:GauPro]{GauPro::GauPro}} -> \code{GauPro_kernel_model_LOO}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{tmod}}{A second GP model for the t-values of leave-one-out predictions}

\item{\code{use_LOO}}{Should the leave-one-out error corrections be used?}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{GauPro_kernel_model_LOO$new()}}
\item \href{#method-update}{\code{GauPro_kernel_model_LOO$update()}}
\item \href{#method-pred_one_matrix}{\code{GauPro_kernel_model_LOO$pred_one_matrix()}}
\item \href{#method-clone}{\code{GauPro_kernel_model_LOO$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="cool1Dplot">}\href{../../GauPro/html/GauPro.html#method-cool1Dplot}{\code{GauPro::GauPro$cool1Dplot()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="deviance">}\href{../../GauPro/html/GauPro.html#method-deviance}{\code{GauPro::GauPro$deviance()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="deviance_fngr">}\href{../../GauPro/html/GauPro.html#method-deviance_fngr}{\code{GauPro::GauPro$deviance_fngr()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="deviance_grad">}\href{../../GauPro/html/GauPro.html#method-deviance_grad}{\code{GauPro::GauPro$deviance_grad()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="fit">}\href{../../GauPro/html/GauPro.html#method-fit}{\code{GauPro::GauPro$fit()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="get_optim_functions">}\href{../../GauPro/html/GauPro.html#method-get_optim_functions}{\code{GauPro::GauPro$get_optim_functions()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad">}\href{../../GauPro/html/GauPro.html#method-grad}{\code{GauPro::GauPro$grad()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_dist">}\href{../../GauPro/html/GauPro.html#method-grad_dist}{\code{GauPro::GauPro$grad_dist()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_norm">}\href{../../GauPro/html/GauPro.html#method-grad_norm}{\code{GauPro::GauPro$grad_norm()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_norm2_dist">}\href{../../GauPro/html/GauPro.html#method-grad_norm2_dist}{\code{GauPro::GauPro$grad_norm2_dist()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_norm2_mean">}\href{../../GauPro/html/GauPro.html#method-grad_norm2_mean}{\code{GauPro::GauPro$grad_norm2_mean()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_norm2_sample">}\href{../../GauPro/html/GauPro.html#method-grad_norm2_sample}{\code{GauPro::GauPro$grad_norm2_sample()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="grad_sample">}\href{../../GauPro/html/GauPro.html#method-grad_sample}{\code{GauPro::GauPro$grad_sample()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="hessian">}\href{../../GauPro/html/GauPro.html#method-hessian}{\code{GauPro::GauPro$hessian()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="loglikelihood">}\href{../../GauPro/html/GauPro.html#method-loglikelihood}{\code{GauPro::GauPro$loglikelihood()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="optim">}\href{../../GauPro/html/GauPro.html#method-optim}{\code{GauPro::GauPro$optim()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="optimRestart">}\href{../../GauPro/html/GauPro.html#method-optimRestart}{\code{GauPro::GauPro$optimRestart()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="param_optim_lower">}\href{../../GauPro/html/GauPro.html#method-param_optim_lower}{\code{GauPro::GauPro$param_optim_lower()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="param_optim_start">}\href{../../GauPro/html/GauPro.html#method-param_optim_start}{\code{GauPro::GauPro$param_optim_start()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="param_optim_start0">}\href{../../GauPro/html/GauPro.html#method-param_optim_start0}{\code{GauPro::GauPro$param_optim_start0()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="param_optim_start_mat">}\href{../../GauPro/html/GauPro.html#method-param_optim_start_mat}{\code{GauPro::GauPro$param_optim_start_mat()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="param_optim_upper">}\href{../../GauPro/html/GauPro.html#method-param_optim_upper}{\code{GauPro::GauPro$param_optim_upper()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="plot1D">}\href{../../GauPro/html/GauPro.html#method-plot1D}{\code{GauPro::GauPro$plot1D()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="plot2D">}\href{../../GauPro/html/GauPro.html#method-plot2D}{\code{GauPro::GauPro$plot2D()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred">}\href{../../GauPro/html/GauPro.html#method-pred}{\code{GauPro::GauPro$pred()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_LOO">}\href{../../GauPro/html/GauPro.html#method-pred_LOO}{\code{GauPro::GauPro$pred_LOO()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_mean">}\href{../../GauPro/html/GauPro.html#method-pred_mean}{\code{GauPro::GauPro$pred_mean()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_meanC">}\href{../../GauPro/html/GauPro.html#method-pred_meanC}{\code{GauPro::GauPro$pred_meanC()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_var">}\href{../../GauPro/html/GauPro.html#method-pred_var}{\code{GauPro::GauPro$pred_var()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_var_after_adding_points">}\href{../../GauPro/html/GauPro.html#method-pred_var_after_adding_points}{\code{GauPro::GauPro$pred_var_after_adding_points()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_var_after_adding_points_sep">}\href{../../GauPro/html/GauPro.html#method-pred_var_after_adding_points_sep}{\code{GauPro::GauPro$pred_var_after_adding_points_sep()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_var_reduction">}\href{../../GauPro/html/GauPro.html#method-pred_var_reduction}{\code{GauPro::GauPro$pred_var_reduction()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="pred_var_reductions">}\href{../../GauPro/html/GauPro.html#method-pred_var_reductions}{\code{GauPro::GauPro$pred_var_reductions()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="predict">}\href{../../GauPro/html/GauPro.html#method-predict}{\code{GauPro::GauPro$predict()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="print">}\href{../../GauPro/html/GauPro.html#method-print}{\code{GauPro::GauPro$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="sample">}\href{../../GauPro/html/GauPro.html#method-sample}{\code{GauPro::GauPro$sample()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_K_and_estimates">}\href{../../GauPro/html/GauPro.html#method-update_K_and_estimates}{\code{GauPro::GauPro$update_K_and_estimates()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_corrparams">}\href{../../GauPro/html/GauPro.html#method-update_corrparams}{\code{GauPro::GauPro$update_corrparams()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_data">}\href{../../GauPro/html/GauPro.html#method-update_data}{\code{GauPro::GauPro$update_data()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_fast">}\href{../../GauPro/html/GauPro.html#method-update_fast}{\code{GauPro::GauPro$update_fast()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_nugget">}\href{../../GauPro/html/GauPro.html#method-update_nugget}{\code{GauPro::GauPro$update_nugget()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro" data-id="update_params">}\href{../../GauPro/html/GauPro.html#method-update_params}{\code{GauPro::GauPro$update_params()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Create a kernel model that uses a leave-one-out GP model
to fix the standard error predictions.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{GauPro_kernel_model_LOO$new(..., LOO_kernel, LOO_options = list())}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{Passed to super$initialize.}

\item{\code{LOO_kernel}}{The kernel that should be used for the
leave-one-out model. Shouldn't be too smooth.}

\item{\code{LOO_options}}{Options passed to the leave-one-out model.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-update"></a>}}
\if{latex}{\out{\hypertarget{method-update}{}}}
\subsection{Method \code{update()}}{
Update the model. Should only give in
(Xnew and Znew) or (Xall and Zall).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{GauPro_kernel_model_LOO$update(
  Xnew = NULL,
  Znew = NULL,
  Xall = NULL,
  Zall = NULL,
  restarts = 5,
  param_update = self$param.est,
  nug.update = self$nug.est,
  no_update = FALSE
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{Xnew}}{New X values to add.}

\item{\code{Znew}}{New Z values to add.}

\item{\code{Xall}}{All X values to be used. Will replace existing X.}

\item{\code{Zall}}{All Z values to be used. Will replace existing Z.}

\item{\code{restarts}}{Number of optimization restarts.}

\item{\code{param_update}}{Are the parameters being updated?}

\item{\code{nug.update}}{Is the nugget being updated?}

\item{\code{no_update}}{Are no parameters being updated?}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-pred_one_matrix"></a>}}
\if{latex}{\out{\hypertarget{method-pred_one_matrix}{}}}
\subsection{Method \code{pred_one_matrix()}}{
Predict for a matrix of points
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{GauPro_kernel_model_LOO$pred_one_matrix(
  XX,
  se.fit = F,
  covmat = F,
  return_df = FALSE
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{XX}}{points to predict at}

\item{\code{se.fit}}{Should standard error be returned?}

\item{\code{covmat}}{Should covariance matrix be returned?}

\item{\code{return_df}}{When returning se.fit, should it be returned in
a data frame?}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{GauPro_kernel_model_LOO$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
