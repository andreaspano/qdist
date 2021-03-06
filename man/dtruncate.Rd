% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dtruncate.R
\name{dtruncate}
\alias{dtruncate}
\title{generate a truncated density function}
\usage{
dtruncate(ddist, pdist)
}
\arguments{
\item{qdist}{probability function as a character string}
}
\description{
generate a truncated density function
}
\examples{
tdnorm <- dtruncate(ddist = 'dnorm', pdist = 'pnorm')
tdnorm(x = 0, mean = 2, sd = 2, L = -1, U = 2)
}
