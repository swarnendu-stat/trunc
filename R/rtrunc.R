#' Random truncated generation for any univariate distribution in the namespace
#' @description
#' `rtrunc` generates random numbers for any truncated univariate distribution that is present in the namespace
#' @param n number of observations. If length(n) > 1, the length is taken to be the number required.
#' @param a left-truncation point.
#' @param b right-truncation point
#' @param dist name of the univariate distribution (e.g., `norm`, `lnorm`, `binom`,
#' `gompertz`, `gamma`).
#' @param args a named list of parameter vectors corresponding to the distribution
#' (e.g., `list(mean = 10, sd = 100)` for `norm`)
#' @returns Generates random deviates. The length of the result is determined by n.
#' The numerical arguments other than n are recycled to the length of the result.
#' @examples
#' rtrunc(n = 10, a = 0, dist = "norm", args = list(mean = 10, sd = 10))
#' rtrunc(n = 10, a = 2, dist = "binom", args = list(size = 10, prob = 0.2))
#' @export
rtrunc <- function(n = 1, a = -Inf, b = Inf, dist = "norm", args = list("mean" = 0, "sd" = 1)) {
  stopifnot("a < b is necessary" = a < b)
  # req_args <- setdiff(names(formals(paste0("r", dist))), "n")
  # extra_arg <- setdiff(names(args), req_args)
  # if (length(extra_arg)) {
  #   for (x in extra_arg) { args[[x]] <- NULL }
  #   args <- purrr::compact(args)
  # }
  F_a <- do.call(what = paste0("p", dist), args = append(list("q" = a, "lower.tail" = TRUE), args))
  F_b <- do.call(what = paste0("p", dist), args = append(list("q" = b, "lower.tail" = TRUE), args))
  u_samp <- stats::runif(n = n, min = F_a, max = F_b)
  return(do.call(what = paste0("q", dist), args = append(list("p" = u_samp, "lower.tail" = TRUE), args)))
}
