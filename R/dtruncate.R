#' @title generate a truncated density function
#' @param qdist densiity function as a character string
#' @param qdist probability function as a character string
#' @examples
#' tdnorm <- dtruncate(ddist = 'dnorm', pdist = 'pnorm')
#' tdnorm(x = 0, mean = 2, sd = 2, L = -1, U = 2)
#' @export
dtruncate <- function (ddist, pdist){

    # ddist=paste("d", dist, sep = "")
    # pdist=paste("p", dist, sep = "")


    #gets density function
    ddist <-  get(ddist, mode = "function")

    #gets argument of density function
    dargs <- formals(ddist)


    #gets probability function
    pdist <- get(pdist, mode = "function")

    #gets argument of probability function
    pargs <- formals(pdist)


    #Output function starts here
    density <- function ()
    {
      #check L U
      if (L > U) stop("U must be greater than or equal to L")

      #gets density arguments

      call <- as.list(match.call())[-1]

      #call[is.element(names(call), names(dargs))] ->
      #arguments passed to density and belonging to dargs
      #i.e. arguments belonging to density function ddist

      #c(dargs[!is.element(names(dargs), names(call))]
      #arguments belonging to dargs i.e. arguments belonging to density function ddist
      # and not being part of arguments passed to density

      #as a result, the whole string gets all unique arguments belonging to density function and ddist
      #dargs <- c(dargs[!is.element(names(dargs), names(call))], call[is.element(names(call), names(dargs))])
      dargs <- intersect_args(x = dargs, y = call)

      #all unique arguments belonging to probability and pdist
      #pargs <- c(pargs[!is.element(names(pargs), names(call))], call[is.element(names(call), names(pargs))])
      pargs <- intersect_args(x = pargs, y = call)

      #select x only where defined by L and U
      dargs$x <- x[x > L & x <= U]

      #define arguments for pdist in L and U
      pUargs <-  pLargs <- pargs
      pUargs$q <- U
      pLargs$q <- L

      #initialize output
      density <- numeric(length(x))

      #this is standard method for computing density values for truncated distributions
      #density[x >= L & x <= U] =  do.call("ddist", as.list(dargs)) / (do.call("pdist", as.list(pUargs)) - do.call("pdist", as.list(pLargs)))

      dx <- do.call("ddist", as.list(dargs))
      pU <- do.call("pdist", as.list(pUargs))
      pL <- do.call("pdist", as.list(pLargs))

      #density[x > L & x <= U] <-  do.call("ddist", as.list(dargs)) / (do.call("pdist", as.list(pUargs)) - do.call("pdist", as.list(pLargs)))
      density[x > L & x <= U] <-  dx /(pU - pL)

      #returns density values for truncated distributions
      return(density)

    }

    #add to density function formals L and U with values as passed with dtruncate
    formals(density) <-  c(formals(ddist), eval(substitute(alist(L=-Inf, U=Inf))))

    #return density function
    return(density)
  }
