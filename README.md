
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trunc

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of trunc is to …

## Installation

You can install the development version of trunc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gsk-tech/trunc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(trunc)
## basic example code
```

``` r
dtrunc(a = 2, dist = "binom", x = 3, args = list(size = 10, prob = 0.2))
#> [1] 0.6248488
rtrunc(n = 10, a = 0, dist = "norm", args = list(mean = 10, sd = 10))
#>  [1]  9.297495 10.936153 11.464103 19.066270 30.428910 23.557686 21.154132
#>  [8]  7.283295  3.815447  8.494062
ptrunc(a = 2, dist = "binom", q = 6, args = list(size = 10, prob = 0.2))
#> [1] 0.9973173
qtrunc(a = 0, dist = "norm", p = 0.95, args = list(mean = 10, sd = 10))
#> [1] 27.27185
```
