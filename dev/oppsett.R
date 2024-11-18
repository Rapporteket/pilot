##############################
## Kjøring på mobilt kontor ##
##############################

devtools::install("../rapbase/.")
devtools::install(upgrade = FALSE, dependencies = FALSE)

source("dev/sysSetenv.R")
pilot::run_app()

