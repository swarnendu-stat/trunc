test_that("cdf works", {
  expect_equal(ptrunc(a = 0, b = 1, dist = "norm", q = 0.96, args = list(mean = 0, sd = 1)),
               (pnorm(q = 0.96, mean = 0, sd = 1) - pnorm(q = 0, mean = 0, sd = 1))/(pnorm(q = 1, mean = 0, sd = 1) - pnorm(q = 0, mean = 0, sd = 1)))
})
