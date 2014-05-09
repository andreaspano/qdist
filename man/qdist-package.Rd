\name{qdist-package}
\alias{qdist-package}
\alias{qdist}
\docType{package}
\title{
qdist: generate truncated distributions functions

}
\description{
\code{dtruncate}, \code{ptruncate}, \code{qtruncate} and \code{rtruncate} generate R functions returning respectively density, probability, quantile and random truncated function for any existing distribution function.
}
\details{
\tabular{ll}{
Package: \tab qdist\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-09-18\cr
License: \tab What license is it under?\cr
}
\code{qtruncdist} is a function of functions opertors
}
\author{
Andrea Spano \email{andrea.spano@quantide.com}
}
\references{
Nadarajah, S. and S. Kotz, 2006. \code{R} Programs for Computing
Truncated Distributions, \emph{Journal of Statistical Software},
16, August 2006, \url{http://www.jstatsoft.org/v16/c02}

Hadley Wickham.  Advanced \code{R} programming   \url{http://adv-r.had.co.nz/}

}
\keyword{ distribution }
\keyword{ truncdist }
\seealso{
\link[truncdist]{ptrunc}
\link[truncdist]{dtrunc}
\link[truncdist]{qtrunc}
\link[truncdist]{rtrunc}
}
\examples{
tplnorm <- ptruncate("lnorm")
head(tplnorm)
}
