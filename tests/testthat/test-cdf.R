test_that("cdf works", {
  expect_equal(ptrunc(a = 0, b = 1, dist = "norm", q = 0.96, args = list(mean = 0, sd = 1)),
               (pnorm(q = 0.96, mean = 0, sd = 1) - pnorm(q = 0, mean = 0, sd = 1))/(pnorm(q = 1, mean = 0, sd = 1) - pnorm(q = 0, mean = 0, sd = 1)))
})

test_that("cdf matches", {
  expect_equal(ptrunc(a = 0, b = 1, dist = "norm", q = 0.96, args = list(mean = 0, sd = 1)),
               truncnorm::ptruncnorm(q = 0.96, a = 0, b = 1, mean = 0, sd = 1))
})

test_that("cdf matches", {
  library(flexsurv)
  expect_equal(ptrunc(a = 2, dist = "gompertz", q = 3, args = list(shape = 1, rate = 1)),
               (pgompertz(q = 3, shape = 1, rate = 1) - pgompertz(q = 2, shape = 1, rate = 1))/(pgompertz(q = Inf, shape = 1, rate = 1) - pgompertz(q = 2, shape = 1, rate = 1)))
})
