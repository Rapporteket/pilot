##############################
## Kjøring på mobilt kontor ##
##############################

devtools::install("../rapbase/.")
devtools::install(upgrade = FALSE, dependencies = FALSE)

source("dev/sysSetenv.R")

logger::log_threshold(level = "INFO")
logger::log_messages()
logger::log_errors()
logger::log_warnings()
logger::formatter_json()
logger::log_threshold()
logger::log_layout(logger::layout_json())
pilot::run_app()

