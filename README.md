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

