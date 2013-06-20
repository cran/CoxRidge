\name{GBSG}
\alias{GBSG}
\docType{data}
\title{German Breast Cancer Study Group.}
\description{A data frame containing the observations from the GBSG study.}
\usage{data(GBSG)}
\format{
This data frame contains the observations of 686 women:
  \describe{
    \item{\code{id}}{patient id 1...686.}
    \item{\code{htreat}}{hormonal therapy, a factor at two levels 0 (no) and 1 (yes).}
    \item{\code{age}}{age of the patients in years.}
    \item{\code{menostat}}{ menopausal status, a factor at two levels 1 (premenopausal) and 2 (postmenopausal).}
    \item{\code{tumsize}}{ tumor size (in mm).}
    \item{\code{grade}}{tumor grade.}
    \item{\code{posnodal }}{number of positive nodes.}
    \item{\code{prm}}{progesterone receptor (in fmol).}
     \item{\code{esm}}{estrogen receptor (in fmol).}
      \item{\code{rfst}}{rfst recurrence free survival time (in days).}
       \item{\code{cens}}{ censoring indicator (0 censored, 1 event).}
  }

}

\source{
Beyerle, R.L.A. Neumann and H.F. Rauschecker for the German Breast Cancer Study Group (1994).
Randomized 2x 2 trial evaluating hormonal treatment and the duration of chemotherapy in nodepositive
breast cancer patients. Journal of Clinical Oncology, 12, 2086-2093.
W. Sauerbrei and P. Royston (1999). Building multivariable prognostic and diagnostic models:
transformation of the predictors by using fractional polynomials. Journal of the Royal Statistics
Society Series A, Volume 162(1), 71-94.}
\references{
\code{package(mfp)}
}
\examples{
data(GBSG)
str(GBSG) 
}
\keyword{datasets}
