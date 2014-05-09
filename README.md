## qdist

A set of four functions: `dtruncate()`, `ptruncate()`,  `qtruncate()`  a `rtruncate()` returning functions for computing probability density functions, cumulative distribution functions, quantile functions and random numbers for truncated random variables.

qdist assumes the standard `R` notation for random variables: distribution functions names are made of a prefix: either `d`, `p`, `q` or `r` followed by a chacater string identifying the distribution `norm`, `weibull`, `poisson`. As examples of this naming convention, `pnorm()` identify  the probability function for normal distribution,   `rweibull()` the random number generator function for the Weibull distribution and `qpois()` the quantie function for a Poisson distribution     