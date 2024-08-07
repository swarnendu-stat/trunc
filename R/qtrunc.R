#' Gives the truncated quantile function for any univariate distribution in the namespace
#' @description
#' `qtrunc` generates quantile function for any truncated univariate distribution that is present in the namespace
#'
#' @param a left-truncation point.
#' @param b right-truncation point
#' @param dist name of the univariate distribution (e.g., `norm`, `lnorm`, `binom`,
#' `gompertz`, `gamma`).
#' @param p vector of probabilities.
#' @param args a named list of parameter vectors corresponding to the distribution
#' (e.g., `list(mean = 10, sd = 100)` for `norm`)
#' @param lower.tail logical; if TRUE (default), probabilities are \eqn{P[X \leq x]} otherwise, \eqn{P[X > x]}.
#' @returns gives the distribution function
#' @examples
#' qtrunc(a = 0, dist = "norm", p = 0.95, args = list(mean = 10, sd = 10))
#' qtrunc(a = 2, dist = "binom", p = 0.5, args = list(size = 10, prob = 0.2))
#' @export
qtrunc <- function(a = -Inf, b = Inf, dist = "norm", p, args = list("mean" = 0, "sd" = 1), lower.tail = TRUE) {
  stopifnot("a < b is necessary" = a < b)
  # req_args <- setdiff(names(formals(paste0("r", dist))), "n")
  # extra_arg <- setdiff(names(args), req_args)
  # if (length(extra_arg)) {
  #   for (x in extra_arg) { args[[x]] <- NULL }
  #   args <- purrr::compact(args)
  # }
  F_a <- do.call(what = paste0("p", dist), args = append(list("q" = a, "lower.tail" = TRUE), args))
  F_b <- do.call(what = paste0("p", dist), args = append(list("q" = b, "lower.tail" = TRUE), args))
  p_untrunc <- p*(F_b-F_a) + F_a
  return(do.call(what = paste0("q", dist), args = append(list("p" = p_untrunc, "lower.tail" = lower.tail), args)))
}
