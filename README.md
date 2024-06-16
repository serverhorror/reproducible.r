# reproducible.r

## Setting up the environment

* This is a one time requirement when starting a new project

    ```r
    R -e 'install.packages("renv")'
    ```

    You will see output similar to this:

    ```text
    R version 4.4.0 (2024-04-24) -- "Puppy Cup"
    Copyright (C) 2024 The R Foundation for Statistical Computing
    Platform: x86_64-pc-linux-gnu

    R is free software and comes with ABSOLUTELY NO WARRANTY.
    You are welcome to redistribute it under certain conditions.
    Type 'license()' or 'licence()' for distribution details.

    Natural language support but running in an English locale

    R is a collaborative project with many contributors.
    Type 'contributors()' for more information and
    'citation()' on how to cite R or R packages in publications.

    Type 'demo()' for some demos, 'help()' for on-line help, or
    'help.start()' for an HTML browser interface to help.
    Type 'q()' to quit R.

    > install.packages("renv")
    Installing package into ‘/usr/local/lib/R/site-library’
    (as ‘lib’ is unspecified)
    trying URL 'https://p3m.dev/cran/__linux__/jammy/latest/src/contrib/renv_1.0.7.tar.gz'
    Content type 'binary/octet-stream' length 2119732 bytes (2.0 MB)
    ==================================================
    downloaded 2.0 MB

    * installing *binary* package ‘renv’ ...
    * DONE (renv)

    The downloaded source packages are in
            ‘/tmp/RtmpyIeZ6U/downloaded_packages’
    > 
    > 
    ```

## Write your R code

* Note how we **do not** install `tibble` before using it

    **NOTE** - If you do not use a the `rocker/r-ver-base` image, `tibble` might be missing.
    We will solve this in the next step.

    ```r
    #!/usr/bin/env Rscript

    t <- tibble::tibble(x = 1:5, y = 1, z = x^2 + y)

    print(t)
    ```

* Make your script runnable

    ```bash
    chmod +x script.R
    ```

    Enjoy

    ```shell-session
    $ ./script.R 
    # A tibble: 5 × 3
        x     y     z
    <int> <dbl> <dbl>
    1     1     1     2
    2     2     1     5
    3     3     1    10
    4     4     1    17
    5     5     1    26
    ```

* Initialize your `renv`-environment

    ```bash
    R -e 'renv::init()'
    ```

    ```text
    R version 4.4.0 (2024-04-24) -- "Puppy Cup"
    Copyright (C) 2024 The R Foundation for Statistical Computing
    Platform: x86_64-pc-linux-gnu

    R is free software and comes with ABSOLUTELY NO WARRANTY.
    You are welcome to redistribute it under certain conditions.
    Type 'license()' or 'licence()' for distribution details.

    Natural language support but running in an English locale

    R is a collaborative project with many contributors.
    Type 'contributors()' for more information and
    'citation()' on how to cite R or R packages in publications.

    Type 'demo()' for some demos, 'help()' for on-line help, or
    'help.start()' for an HTML browser interface to help.
    Type 'q()' to quit R.

    > renv::init()
    - Linking packages into the project library ... Done!
    - Resolving missing dependencies ... 
    # Installing packages --------------------------------------------------------
    The following package(s) will be updated in the lockfile:

    # RSPM -----------------------------------------------------------------------
    - cli         [* -> 3.6.2]
    - fansi       [* -> 1.0.6]
    - glue        [* -> 1.7.0]
    - lifecycle   [* -> 1.0.4]
    - magrittr    [* -> 2.0.3]
    - pillar      [* -> 1.9.0]
    - pkgconfig   [* -> 2.0.3]
    - renv        [* -> 1.0.7]
    - rlang       [* -> 1.1.4]
    - tibble      [* -> 3.2.1]
    - utf8        [* -> 1.2.4]
    - vctrs       [* -> 0.6.5]

    The version of R recorded in the lockfile will be updated:
    - R           [* -> 4.4.0]

    - Lockfile written to "/workspaces/reproducible.r/renv.lock".
    - Project '/workspaces/reproducible.r' loaded. [renv 1.0.7]
    > 
    > 
    ```
