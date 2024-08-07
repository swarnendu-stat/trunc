test_that("density works", {
  expect_equal(dtrunc(a = 2, dist = "binom", x = 3, args = list(size = 10, prob = 0.2)),
               dbinom(x = 3, size = 10, prob = 0.2)/(pbinom(q = Inf, size = 10, prob = 0.2) - pbinom(q = 2, size = 10, prob = 0.2)))
})

test_that("density matches", {
  expect_equal(dtrunc(a = 2, dist = "norm", x = 3, args = list(mean = 10, sd = 10)),
               truncnorm::dtruncnorm(x = 3, a = 2, mean = 10, sd = 10))
})

test_that("density matches", {
  skip_if_not_installed("survival")
  skip_if_not_installed("flexsurv")
  library(survival)
  library(flexsurv)
  expect_equal(dtrunc(a = 2, dist = "gompertz", x = 3, args = list(shape = 1, rate = 1)),
               dgompertz(x = 3, shape = 1, rate = 1)/(pgompertz(q = Inf, shape = 1, rate = 1) - pgompertz(q = 2, shape = 1, rate = 1)))
})
