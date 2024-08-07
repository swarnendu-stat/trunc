#' Truncated density generation for any univariate distribution in the namespace
#' @description
#' `dtrunc` generates density for any truncated univariate distribution that is present in the namespace
#' @param a left-truncation point.
#' @param b right-truncation point
#' @param dist name of the univariate distribution (e.g., `norm`, `lnorm`, `binom`,
#' `gompertz`, `gamma`).
#' @param x vector of quantiles.
#' @param args a named list of parameter vectors corresponding to the distribution
#' (e.g., `list(mean = 10, sd = 100)` for `norm`)
#' @returns Generates random deviates. The length of the result is determined by n.
#' The numerical arguments other than n are recycled to the length of the result.
#' @examples
#' dtrunc(a = 0, dist = "norm", x = 1, args = list(mean = 10, sd = 10))
#' dtrunc(a = 2, dist = "binom", x = 3, args = list(size = 10, prob = 0.2))
#' @export
dtrunc <- function(a = -Inf, b = Inf, dist = "gompertz", x, args = list("shape" = 1, "rate" = 1)) {
  stopifnot("a < b is necessary" = a < b)
  stopifnot("a <= x is necessary" = all(a <= x))
  stopifnot("x <= b is necessary" = all(x <= b))
  req_args <- setdiff(names(formals(paste0("r", dist))), "n")
  extra_arg <- setdiff(names(args), req_args)
  if (length(extra_arg)) {
    for (x in extra_arg) { args[[x]] <- NULL }
    args <- purrr::compact(args)
  }
  F_a <- do.call(what = paste0("p", dist), args = append(list("q" = a, "lower.tail" = TRUE), args))
  F_b <- do.call(what = paste0("p", dist), args = append(list("q" = b, "lower.tail" = TRUE), args))
  return(do.call(what = paste0("d", dist), args = append(list("x" = x), args))/(F_b-F_a))
}
