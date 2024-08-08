test_that("random matches", {
  expect_equal(unname(quantile(rtrunc(n = 1e8, a = -1, b = 0.5, dist = "norm", args = list(mean = 0, sd = 4)), c(0.25, 0.5, 0.75))),
               truncnorm::qtruncnorm(p = c(0.25, 0.5, 0.75), a = -1, b = 0.5, mean = 0, sd = 4), tolerance = 0.001)
})
