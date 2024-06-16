# reproducible.r

## There's no time!

* From the manual:

    > You’ll then need to commit renv.lock, .Rprofile, renv/settings.json and renv/activate.R to version control, ensuring that others can recreate your project environment.

    ([Introduction to renv - Collaboration](https://rstudio.github.io/renv/articles/renv.html#collaboration))

    ```text
    # Only in a completely new project
    R -e 'install.packages("renv")'
    R -e 'renv::init()'
    ```

    ```text
    # In every project
    R -e 'renv::restore()'
    R -e 'renv::status()'
    R -e 'install.packages("rmarkdown")'
    R -e 'renv::snapshot()'
    git add renv.lock .Rprofile renv/settings.json renv/activate.R
    git commit -m "Add renv environment"
    git push --all
    ```


## Setting up the environment

* This is a one time requirement when starting a new project

    ```shell
    R -e 'install.packages("renv")'
    ```

    You will see output similar to this:

    ```text
    # [ ... skipped for brevity ... ]
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
    # [ ... skipped for brevity ... ]
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

* You'll end up with a few more files:

    * `.Rprofile`
    * `renv.lock`
    * `.gitignore` - if it wasn't there before
    * `activate.R`
    * `settings.json`

* Make sure we are up-to-date

    ```shell
    R -e 'renv::restore()'
    ```

    Pay attention to `The library is already synchronized with the lockfile.`

    ```text
    # [ ... skipped for brevity ... ]
    - Project '/workspaces/reproducible.r' loaded. [renv 1.0.7]
    > renv::restore()
    - The library is already synchronized with the lockfile.
    > 
    > 
    ```

* add a `notes.Rmd` file

    ```r
        ---
        title: "reproducible.r"
        ---

        ```{r}
        source("script.R")
        ```
    ```

    If you are in VS Code, you can use the `R` extension to render the markdown file.
    You will see the following error message:

    ```text
    [VSC-R] notes.Rmd process started
    - The project is out-of-sync -- use `renv::status()` for details.

    Error: Previewing documents requires the {rmarkdown} package.
    Execution halted

    [VSC-R] notes.Rmd process exited with exit code 1
    [VSC-R] terminating R process
    ```    

    ```shell
    R -e 'renv::status()'
    ```

    ```text
    # [ ... skipped for brevity ... ]

    - Project '/workspaces/reproducible.r' loaded. [renv 1.0.7]
    - The project is out-of-sync -- use `renv::status()` for details.
    > renv::status()
    The following package(s) are used in this project, but are not installed:
    - rmarkdown

    See ?renv::status() for advice on resolving these issues.
    > 
    > 
    ```

    ```shell-session
    R -e 'install.packages("rmarkdown")'
    # [ ... skipped for brevity ... ]
    ```

    ```shell-session
    R -e 'renv::snapshot()'

    # [ ... skipped for brevity ... ]

    - Project '/workspaces/reproducible.r' loaded. [renv 1.0.7]
    - The project is out-of-sync -- use `renv::status()` for details.
    > renv::snapshot()
    The following package(s) will be updated in the lockfile:

    # CRAN -----------------------------------------------------------------------
    - base64enc     [* -> 0.1-3]
    - bslib         [* -> 0.7.0]
    - cachem        [* -> 1.1.0]
    - digest        [* -> 0.6.35]
    - evaluate      [* -> 0.24.0]
    - fastmap       [* -> 1.2.0]
    - fontawesome   [* -> 0.5.2]
    - fs            [* -> 1.6.4]
    - highr         [* -> 0.11]
    - htmltools     [* -> 0.5.8.1]
    - jquerylib     [* -> 0.1.4]
    - jsonlite      [* -> 1.8.8]
    - knitr         [* -> 1.47]
    - memoise       [* -> 2.0.1]
    - mime          [* -> 0.12]
    - R6            [* -> 2.5.1]
    - rappdirs      [* -> 0.3.3]
    - rmarkdown     [* -> 2.27]
    - sass          [* -> 0.4.9]
    - tinytex       [* -> 0.51]
    - xfun          [* -> 0.44]
    - yaml          [* -> 2.3.8]

    - Lockfile written to "/workspaces/reproducible.r/renv.lock".
    > 
    > 
    ```
