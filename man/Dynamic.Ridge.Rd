\name{Dynamic.Ridge}
\alias{Dynamic.Ridge}
\title{
Fit a Cox model with time dependent effects of the covariates and penalized likelihood.  
}
\description{
Fits a Cox model on which some, or all, of the covariates are allowed to have time varying effects. The likelihood is penalized either using a simple ridge penalty on all time varying covariates ("simple") or a dynamic ridge penalty ("dynamic") which includes the used time functions in the penalty. There is also the option for a "weighted" ridge penalty based on the baseline hazard.
}
\usage{
Dynamic.Ridge(time, death, X, R, Ft, lambda = 0, fun = c("dynamic", "weighted","simple"),
eps = 1e-06, iter.max = 200, theta, mon = FALSE, lambdaFixed = FALSE)
}
\arguments{
  \item{time}{a vector containing failure/censoring times.}
  \item{death}{a vector containing the status indicator.}
  \item{X}{a matrix of time varying covariates.}
  \item{R}{an optional matrix of time fixed covariates. When R is missing then all covariates are assumed to be time varying.}
  \item{Ft}{a matrix containing the time functions. The first column must be constant.}
  \item{lambda}{When lambdaFixed is FALSE lambda is a scalar giving the starting value for the weight of the penalty. When lambdaFixed is true lambda is the chosen weight of the penalty.}
  \item{fun}{"simple", "dynamic", or "weigthed": types of penalty. }
  \item{eps}{a small value. The criterion of convergance.}
  \item{iter.max}{maximum number of iterations, default is  200.}
  \item{theta}{an optional matrix of starting values for coefficients of time varying effects.}
  \item{mon}{when true the function prints out the computed lambda weigh in each iteration.}
  \item{lambdaFixed}{when TRUE the function does not seek to optimize the penalty weight.}
}


\value{\code{Dynamic.Ridge} returns an object of class "cox.dynamic.ridge"
The function \code{print.cox.dynamic.ridge} is used to obtain and print a summary of the results. 
An object of class "cox.dynamic.ridge" is a list containing  some the following components:
\item{call }{function call.}
\item{theta }{a matrix of coefficient for the covariates with time varying effects.}
\item{fixed.coef }{the vector of fixed effects coefficients. }
\item{loglik }{the penalized log-likelihood of the model.}
\item{time }{a vector with failure/censoring times.}
\item{death }{a vector of status indicator.}
\item{X}{the matrix of time varying covariates. }
\item{R}{the matrix of fixed covariates. }
\item{Ft}{the matrix of time functions}
\item{iter }{number of iterations used to maximise likelihood at a fixed lambda.}
\item{inter.it }{number of iterations used to find optimal lambda.'}
\item{lambda }{optimal weight of the penalty.}
\item{Hat }{the hat matrix at convergance.}
\item{h2}{the non-penalized Hessian matrix of second derivatives.}
}


\references{
Perperoglou A.(2013)\emph{Cox models with dynamic ridge penalties on
time varying effects of the covariates}. Statistics in Medicine, to appear}
\author{
Aris Perperoglou
}
\note{
The function at the current form cannot handle missing values. The user has to take prior action with missing values before using this function.
}

\seealso{
coxph, cox.ridge}

\examples{
data(GBSG)
attach(GBSG)
X <- cbind(age,grade)
R <- cbind(tumsize,posnodal,prm,esm)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
R <- apply(R,2,function(x){(x-mean(x))/sqrt(var(x))}) #standardize covariates
Ft <- cbind(rep(1,nrow(X)),bs(rfst))

# a model with all covariates as time varying, simple penalty
fit.dr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=100,fun="simple",lambdaFixed=TRUE)
fit.dr  #regression coefficients correspond to the standardized covariates

# a model with all covariates as time varying, weighted penalty
fit.wdr <- Dynamic.Ridge(rfst,cens,cbind(X,R),Ft=Ft,lambda=324,theta=fit.dr$theta,
fun="weighted",mon=TRUE)
fit.wdr #regression coefficients correspond to the standardized covariates

# a model with fixed and time varying covariates
fit.dr <- Dynamic.Ridge(rfst,cens,X,R,Ft,lambda=150,fun="simple",lambdaFixed=TRUE)
fit.dr
}
\keyword{Dynamic.Ridge }
