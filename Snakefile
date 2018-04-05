# Main Workflow - xaringan-template
# Contributors: @lachlandeer

import glob, os

# --- Importing Configuration Files --- #

configfile: "config.yaml"

# --- Main Build Rules --- #

# To be Done

# --- Packrat Rules --- #

## packrat_install: installs packrat onto machine
rule packrat_install:
    shell:
        "R -e 'install.packages(\"packrat\", \
            repos=\"http://cran.us.r-project.org\")'"

## packrat_install: initialize a packrat environment for this project
rule packrat_init:
    shell:
        "R -e 'packrat::init()'"

## packrat_snap   : Look for new R packages in files & archives them
rule packrat_snap:
    shell:
        "R -e 'packrat::snapshot()'"

## packrat_restore: Installs archived packages onto a new machine
rule packrat_restore:
    shell:
        "R -e 'packrat::restore()'"

# --- Cleaning Rules --- #

## clean_all      : delete all output and log files for this project
rule clean_all:
    shell:
        "rm -rf out/ log/ *.pdf *.html"

## clean_output   : delete all built files in project's output and ROOT directory
rule clean_output:
    shell:
        "rm -rf out/ *.pdf *.html"

## clean_logs     : delete all log files for this project
rule clean_log:
    shell:
        "rm -rf log/"
