\name{print.cox.dynamic.ridge}
\alias{print.cox.dynamic.ridge}
\title{Print a \code{cox.dynamic.ridge} object.}
\description{
Information describing the fitted \code{cox.dynamic.ridge} object.
}
\usage{
\method{print}{cox.dynamic.ridge}(x,\ldots)
}

\arguments{
  \item{x}{
a \code{cox.dynamic.ridge} object.}

  \item{\dots}{
optional arguments passed to print.default; see the documentation on that method
            function.}
}


\seealso{
\code{\link{Dynamic.Ridge}}.
}
\examples{
data(GBSG)
attach(GBSG)
X <- cbind(age,grade)
R <- cbind(tumsize,posnodal,prm,esm)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
R <- apply(R,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
Ft <- cbind(rep(1,nrow(X)),bs(rfst))

# a model with all covariates as time varying, simple penalty
fit.dr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=10,fun="simple",lambdaFixed=TRUE)
fit.dr
          }
          \keyword{print.cox.dynamic.ridge}
