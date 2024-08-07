test_that("density works", {
  expect_equal(dtrunc(a = 2, dist = "binom", x = 3, args = list(size = 10, prob = 0.2)),
               dbinom(x = 3, size = 10, prob = 0.2)/(pbinom(q = Inf, size = 10, prob = 0.2) - pbinom(q = 2, size = 10, prob = 0.2)))
})

test_that("density works", {
  expect_equal(dtrunc(a = 2, dist = "norm", x = 3, args = list(mean = 10, sd = 10)),
               truncnorm::dtruncnorm(x = 3, a = 2, mean = 10, sd = 10))
})
