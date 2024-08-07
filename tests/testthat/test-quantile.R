test_that("quantile works", {
  expect_equal(qtrunc(a = 0, b = 1, dist = "norm", p = 0.5, args = list(mean = 0.5, sd = 1)),
               0.5)
})
