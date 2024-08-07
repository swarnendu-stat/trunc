test_that("quantile works", {
  expect_equal(qtrunc(a = 0, b = 1, dist = "norm", p = 0.5, args = list(mean = 0.5, sd = 1)),
               0.5)
})

test_that("quantile works", {
  expect_equal(qtrunc(a = -1, b = 0.5, dist = "norm", p = 0.75, args = list(mean = 0, sd = 4)),
               truncnorm::qtruncnorm(p = 0.75, a = -1, b = 0.5, mean = 0, sd = 4))
})
