## qdist

A set of four functions: 

* `dtruncate()`: returns functions for computing density
* `ptruncate()`: returns functions for computing probability
* `qtruncate()`: returns functions for computing quantiles
* `rtruncate()` : returns random numbers 

for truncated random variables.

`qdist` assumes the standard `R` notation for random variables: distribution functions names are made of a prefix: either `d`, `p`, `q` or `r` followed by a chacater string identifying the distribution `norm`, `weibull`, `poisson`. 

As examples of this naming convention, `pnorm()` identifies the probability function for normal distribution, `rweibull()` the random number generator function for the Weibull distribution and `qpois()` the quantie function for a Poisson distribution     