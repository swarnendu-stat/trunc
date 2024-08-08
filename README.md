
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trunc

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of `trunc` is to provide facilitate generating random deviate
values, distribution function, density function and quantile function
for uni-variate truncated distributions.

The underlying distribution can be any distribution that is available in
the namespace. For example, `gompertz` distribution available means that
the corresponding `rgompertz`, `dgompertz`, `pgompertz`, `qgompertz` are
available. `trunc` utilizes these functions to provide their truncated
counterpart.

## Installation

You can install from CRAN with:

``` r
install.packages("trunc")
```

Or you can install the development version of trunc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("swarnendu-stat/trunc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(trunc)
## basic example code
```

Density generation:

``` r
dtrunc(a = 2, dist = "binom", x = 3, args = list(size = 10, prob = 0.2))
#> [1] 0.6248488
```

Random deviate generation:

``` r
rtrunc(n = 10, a = 0, dist = "norm", args = list(mean = 10, sd = 10))
#>  [1]  4.31541456  8.65111000  6.51434939 12.34264269  7.87781803 12.13892548
#>  [7] 31.79911268  8.86701469  0.01459709 32.46770838
```

Distribution function generation:

``` r
ptrunc(a = 2, dist = "binom", q = 6, args = list(size = 10, prob = 0.2))
#> [1] 0.9973173
```

Quantile function generation:

``` r
qtrunc(a = 0, dist = "norm", p = 0.95, args = list(mean = 10, sd = 10))
#> [1] 27.27185
```
