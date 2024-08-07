#' Gives the truncated distribution function for any univariate distribution in the namespace
#' @description
#' `ptrunc` generates distribution function for any truncated univariate distribution that is present in the namespace
#'
#' @param a left-truncation point.
#' @param b right-truncation point
#' @param dist name of the univariate distribution (e.g., `norm`, `lnorm`, `binom`,
#' `gompertz`, `gamma`).
#' @param q vector of quantiles.
#' @param args a named list of parameter vectors corresponding to the distribution
#' (e.g., `list(mean = 10, sd = 100)` for `norm`)
#' @param lower.tail logical; if TRUE (default), probabilities are \eqn{P[X \leq x]} otherwise, \eqn{P[X > x]}.
#' @returns gives the distribution function
#' @examples
#' ptrunc(a = 0, dist = "norm", q = 1.96, args = list(mean = 10, sd = 10))
#' ptrunc(a = 2, dist = "binom", q = 6, args = list(size = 10, prob = 0.2))
#' @export
ptrunc <- function(a = -Inf, b = Inf, dist = "gompertz", q, args = list("shape" = 1, "rate" = 1), lower.tail = TRUE) {
  stopifnot("a < b is necessary" = a < b)
  req_args <- setdiff(names(formals(paste0("r", dist))), "n")
  extra_arg <- setdiff(names(args), req_args)
  if (length(extra_arg)) {
    for (x in extra_arg) { args[[x]] <- NULL }
    args <- purrr::compact(args)
  }
  F_a <- do.call(what = paste0("p", dist), args = append(list("q" = a, "lower.tail" = TRUE), args))
  F_b <- do.call(what = paste0("p", dist), args = append(list("q" = b, "lower.tail" = TRUE), args))
  q[q<a] <- a
  q[q>b] <- b
  return((do.call(what = paste0("p", dist), args = append(list("q" = q, "lower.tail" = lower.tail), args)) - F_a)/(F_b-F_a))
}
