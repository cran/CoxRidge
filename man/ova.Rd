\name{ova}
\alias{ova}
\docType{data}
\title{Ovarian cancer data set}
\description{
     Survival times of 358 ovarian cancer patients with information on
     three covariates,  karnofsky status (karn), tumor diameter (diam),
     figo stage (figo) and patients id.}
\usage{data(ova)}
\format{
  A data frame with 358 observations on the following 6 variables.
  \describe{
    \item{\code{time}}{Survival times in days.}
    \item{\code{death}}{Status indicator, 0=censored, 1=death.}
    \item{\code{karn}}{Karnofsky status at the start of the follow up.}
    \item{\code{figo}}{Figo stage.}
    \item{\code{diam}}{Timour diameter.}
    \item{\code{x}}{Patient id.}
  }
}

\source{
   Verweij, P. J. M. and Van Houwelingen H. C. (1993)
     \emph{Cross-validation in survival analysis}. Statistics in Medicine:
     12, 2305-2314}

\examples{
data(ova)
str(ova) 
}
\keyword{datasets}
