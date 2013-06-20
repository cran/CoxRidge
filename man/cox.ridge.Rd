\name{cox.ridge}
\alias{cox.ridge}
\title{
Fit a Cox model with a ridge penalty on all covariates}
\description{Fits a simple Cox model with a ridge penalty on all coefficients. The 
penalty weight can be optimized using a REML-type likelihood method or be chosen by the user.}
\usage{
cox.ridge(formula, lambda = 1, lambdaFixed = FALSE, eps = 10e-6, data = sys.parent(),
iter.max = 200, mon = FALSE)
}
\arguments{
  \item{formula}{
a formula object, with the response on the left of a '~'
          operator, and the terms on the right.  The response must be a
          survival object as returned by the 'Surv' function.}
  \item{lambdaFixed}{
when TRUE the function does not seek to optimize the penalty weight.}
  \item{lambda}{
When lambdaFixed is FALSE lambda is a scalar giving the starting value for the weight of the penalty. When lambdaFixed is true lambda is the chosen weight of the penalty.}
  \item{eps}{
a small value. The criterion of convergance. }
  \item{data}{
an optional data frame containing the variables named in the formula.}
  \item{iter.max}{
maximum number of iterations, default is  200.}
  \item{mon}{
when true the function prints out the computed lambda weigh in each iteration. }
}

\value{\code{cox.ridge} returns an object of class "cox.ridge"
The function print.cox.ridge is used to obtain and print a summary of the results. 
An object of class "cox.ridge" is a list containing  the following components:
\item{call }{function call.}
\item{coef }{the vector of coefficients. }
\item{loglik }{the penalized log-likelihood of the model.}
\item{time }{a vector with failure/censoring times.}
\item{death }{a vector of status indicator.}
\item{X}{a matrix of covariates. }
\item{iter }{number of iterations used to maximise likelihood at a fixed lambda.}
\item{inter.it }{number of iterations used to find optimal lambda.'}
\item{lambda }{optimal weight of the penalty.}
\item{Hat }{the hat matrix at convergance.}
\item{hess}{the Hessian matrix of second derivatives.}
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
coxph, Dynamic.Ridge}
\examples{
data(ova)
attach(ova)
X <- cbind(karn,diam,figo)
X <- apply(X,2,function(x){(x-mean(x))/sqrt(var(x))})#standardize covariates
fit <- cox.ridge(Surv(time,death)~X,lambda=1)
fit ##regression coefficients correspond to the standardized covariates
}
\keyword{cox.ridge}
