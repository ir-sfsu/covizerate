
# covizerate

<!-- badges: start -->
<!-- badges: end -->

The goal of covizerate is to ...

## Installation

You can install the released version of covizerate from GitHub with:

``` r
remotes::install_github("ir-sfsu/covizerate")
```

## Example

``` r
library(covizerate)
df <- data.frame(
  year = 0:7,
  continuation = c(100, 84, 75, 70, 50, 19, 7, 3),
  graduation = c(0, 0, 0, 1, 19, 47, 59, 63)
)
df$continuation <- df$continuation/100
df$graduation <- df$graduation/100

covizerate(df)
```

