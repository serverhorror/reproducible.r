#!/usr/bin/env Rscript

t <- tibble::tibble(x = 1:5, y = 1, z = x^2 + y)

print(t)
