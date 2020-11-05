library(covizerate)

df <- data.frame(
  year = 0:7,
  continuation = c(1, .84, .75, .70, .50, .19, .07, .03),
  graduation = c(0, 0, 0, .01, .19, .47, .59, .63)
)

covizerate(df, "Fall 2010 Cohort")

df %>%
  covizerate("Fall 2010 Cohort") %>%
  cvz_options(grad_fill = "forestgreen", vline_stroke = "gold")
