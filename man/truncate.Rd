\name{truncate}
\alias{dtruncate}
\alias{ptruncate}
\alias{qtruncate}
\alias{rtruncate}
\title{truncate Functions}

\description{
\code{dtruncate}, \code{ptruncate}, \code{qtruncate} and \code{rtruncate} generate R functions returning respectively density, probability, quantile and random truncated function for any existing \code{dist}.
}

\usage{
dtruncate(dist)
          
ptruncate(dist)
          
qtruncate(dist)

rtruncate(dist) 
}
\arguments{
  \item{dist}{
    The underlying distribution: \code{norm}, \code{weibull}, \code{gamma}, \code{...} as a character string 
    }
}
\details{
\code{ptruncdist}, \code{dtruncdist}, \code{qtruncdist} and \code{rtruncdist} are functions returning taking as input a distribution name and returning a functions.

The \code{gamma} distribution may present problems when parameter \code{scale}, rather than \code{rate} is specified. This is due to the check on arguments that is performed within the function body. See package vignettes for more details  

}

\value{
A function object corresponding to the truncated density function (\code{dtruncate}), distribution function (\code{ptruncate}), quantile function (\code{qtruncate}), random function (\code{rtruncate}) for the underlying  \code{dist} provided as input.
}

%\references{
%%Package truncdist reference manual: \link{http://cran.r-project.org/web/packages/truncdist/truncdist.pdf}
%%Hadley Wickham web site: \link{http://adv-r.had.co.nz/}
%%Programming with Data: A Guide to the S Language: \link{http://www.amazon.com/Programming-Data-Language-John-Chambers/dp/0387985034/ref=pd_bxgy_b_img_z}
%}

\references{
Nadarajah, S. and S. Kotz, 2006. \code{R} Programs for Computing
Truncated Distributions, \emph{Journal of Statistical Software},
16, August 2006, \url{http://www.jstatsoft.org/v16/c02}

Hadley Wickham.  Advanced \code{R} programming   \url{http://adv-r.had.co.nz/}
}

\author{
Andrea Spano \email{andrea.spano@quantide.com}
}

%\note{notes here}

\seealso{
\link[truncdist]{ptrunc}
\link[truncdist]{dtrunc}
\link[truncdist]{qtrunc}
\link[truncdist]{rtrunc}
}

\examples{

# example 1: Normal distribution 
tdnorm <- dtruncate(dist = "norm")
x <- seq( -3, 3, len = 1000)
d <- tdnorm(x = x, mean = 0 , sd = 1, L = -2, U = 2)
plot(x , d , xlim= c(-3, 3), 
     ylim = c(0, 1.1*max(d)), type = "l", 
     col = "red", lwd = 2)

# example 2: lognormal distribution 
tplnorm <- ptruncate("lnorm")
tqlnorm <- qtruncate("lnorm")
q <- tqlnorm(ppoints(100), meanlog = 5, sdlog = 2)# , L = 10^4, U = 2*10^4)
p <- tplnorm(q, meanlog = 5, sdlog = 2)# , L = 10^4, U = 2*10^4)
plot(q, p, pch = 16, col = "red", cex = 3/4, xlab = "Quantile", ylab = "Probability")

# example 3: Quantlies from truncated poisson  distribution 
tqpois <- qtruncate("pois")
pp <- ppoints(100)
q <- tqpois(pp, lambda = 5, log = FALSE, L = 4)
barplot(table(q))

#example 4: Random numbers from truncated gpd distribution 
require(evd)
trgpd <- rtruncate(dist = "gpd")
r <- trgpd (n = 1000, loc = 100, scale = 2, shape = .25 , L = 150, U = 200)
hist(r, xlim = c(140,210), col = "lightgray")

#Example 5: gamma example
# It does not work with qgamma() from stats package
# We need to redifine qgamma() as:
qgamma <- function (p, shape, rate = 1, lower.tail = TRUE, log.p = FALSE) {
  scale <-  1/rate
  .External(stats:::C_qgamma, p, shape, scale, lower.tail, log.p)
}

tqgamma <- qtruncate("gamma")
tqgamma(p = ppoints(10), shape = 1, rate = 1, L = 0.5 , U = 1.5)
}
\keyword{ distribution }
\keyword{ truncate }

