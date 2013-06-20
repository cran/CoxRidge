\name{comp.graph}
\alias{comp.graph}
\title{Plot a \code{cox.ridge} or \code{cox.dynamic.ridge} object.}
\description{Plots time varying effects of covariates.}
\usage{
comp.graph(obj, alpha = 0.05, xlab = "time", ylab = "X effect", 
all.terms = TRUE, variable)}
\arguments{
  \item{obj}{
A  \code{cox.ridge} or \code{cox.dynamic.ridge} object.}


  \item{alpha}{The alpha level used for confidence bands.}
  \item{xlab}{a title for the x axis}
  \item{ylab}{a title for the y axis}
  \item{all.terms}{When TRUE all time-varying effects variables are plotted.}
  \item{variable}{when all.terms=FALSE you need to specify which variable to be plotted. Use numbers 1,2,3... for first, second, third etc.}
}
\details{Confidence bands are computed using the delta method. }

\references{Perperoglou A, le Cessie S, van Houwelingen HC (2006). \emph{Reduced-rank hazard regression for modelling non-proportional hazards}. Statistics in Medicine: 25, 2831-2845}

\seealso{\code{plot}}

\examples{
data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})
Ft <- cbind(rep(1,nrow(X)),bs(time))
fit <- Dynamic.Ridge(time,death,X,Ft=Ft,fun="simple")
comp.graph(fit,all.terms=FALSE,variable=1)
par(mfrow=c(3,1))
comp.graph(fit)}

\keyword{comp.graph }