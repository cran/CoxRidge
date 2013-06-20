\name{print.cox.ridge}
\alias{print.cox.ridge}
\title{Print a \code{cox.ridge} object.}
\description{
Information describing the fitted \code{cox.ridge} object.
}
\usage{
\method{print}{cox.ridge}(x,...)
}

\arguments{
  \item{x}{
a \code{cox.ridge} object.}

  \item{\dots}{
optional arguments passed to print.default; see the documentation on that method
            function.}
}


\seealso{
\code{\link{cox.ridge}}.
}
\examples{

data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})#standardize covariates
fit <- cox.ridge(Surv(time,death)~X,lambda=1,lambdaFixed=TRUE)
fit ##regression coefficients correspond to the standardized covariates
          }
          \keyword{print.coxr.ridge}
