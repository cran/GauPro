% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kernel_Matern52.R
\docType{class}
\name{Matern52}
\alias{Matern52}
\title{Matern 5/2 Kernel R6 class}
\format{
\code{\link{R6Class}} object.
}
\value{
Object of \code{\link{R6Class}} with methods for fitting GP model.
}
\description{
Matern 5/2 Kernel R6 class

Matern 5/2 Kernel R6 class
}
\examples{
k1 <- Matern52$new(beta=0)
}
\section{Super classes}{
\code{\link[GauPro:GauPro_kernel]{GauPro::GauPro_kernel}} -> \code{\link[GauPro:GauPro_kernel_beta]{GauPro::GauPro_kernel_beta}} -> \code{GauPro_kernel_Matern52}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{sqrt5}}{Saved value of square root of 5}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-k}{\code{Matern52$k()}}
\item \href{#method-kone}{\code{Matern52$kone()}}
\item \href{#method-dC_dparams}{\code{Matern52$dC_dparams()}}
\item \href{#method-dC_dx}{\code{Matern52$dC_dx()}}
\item \href{#method-clone}{\code{Matern52$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="C_dC_dparams">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-C_dC_dparams}{\code{GauPro::GauPro_kernel_beta$C_dC_dparams()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="initialize">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-initialize}{\code{GauPro::GauPro_kernel_beta$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="param_optim_lower">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-param_optim_lower}{\code{GauPro::GauPro_kernel_beta$param_optim_lower()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="param_optim_start">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-param_optim_start}{\code{GauPro::GauPro_kernel_beta$param_optim_start()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="param_optim_start0">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-param_optim_start0}{\code{GauPro::GauPro_kernel_beta$param_optim_start0()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="param_optim_upper">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-param_optim_upper}{\code{GauPro::GauPro_kernel_beta$param_optim_upper()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="s2_from_params">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-s2_from_params}{\code{GauPro::GauPro_kernel_beta$s2_from_params()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="GauPro" data-topic="GauPro_kernel_beta" data-id="set_params_from_optim">}\href{../../GauPro/html/GauPro_kernel_beta.html#method-set_params_from_optim}{\code{GauPro::GauPro_kernel_beta$set_params_from_optim()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-k"></a>}}
\if{latex}{\out{\hypertarget{method-k}{}}}
\subsection{Method \code{k()}}{
Calculate covariance between two points
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Matern52$k(x, y = NULL, beta = self$beta, s2 = self$s2, params = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{vector.}

\item{\code{y}}{vector, optional. If excluded, find correlation
of x with itself.}

\item{\code{beta}}{Correlation parameters.}

\item{\code{s2}}{Variance parameter.}

\item{\code{params}}{parameters to use instead of beta and s2.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-kone"></a>}}
\if{latex}{\out{\hypertarget{method-kone}{}}}
\subsection{Method \code{kone()}}{
Find covariance of two points
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Matern52$kone(x, y, beta, theta, s2)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{vector}

\item{\code{y}}{vector}

\item{\code{beta}}{correlation parameters on log scale}

\item{\code{theta}}{correlation parameters on regular scale}

\item{\code{s2}}{Variance parameter}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-dC_dparams"></a>}}
\if{latex}{\out{\hypertarget{method-dC_dparams}{}}}
\subsection{Method \code{dC_dparams()}}{
Derivative of covariance with respect to parameters
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Matern52$dC_dparams(params = NULL, X, C_nonug, C, nug)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{params}}{Kernel parameters}

\item{\code{X}}{matrix of points in rows}

\item{\code{C_nonug}}{Covariance without nugget added to diagonal}

\item{\code{C}}{Covariance with nugget}

\item{\code{nug}}{Value of nugget}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-dC_dx"></a>}}
\if{latex}{\out{\hypertarget{method-dC_dx}{}}}
\subsection{Method \code{dC_dx()}}{
Derivative of covariance with respect to X
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Matern52$dC_dx(XX, X, theta, beta = self$beta, s2 = self$s2)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{XX}}{matrix of points}

\item{\code{X}}{matrix of points to take derivative with respect to}

\item{\code{theta}}{Correlation parameters}

\item{\code{beta}}{log of theta}

\item{\code{s2}}{Variance parameter}
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
\if{html}{\out{<div class="r">}}\preformatted{Matern52$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
