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

######################
# autoreport-innslag #
######################


tmp_yml <- yaml::read_yaml("./dev/test.yml")
tmp_json <- jsonlite::serializeJSON(tmp_yml)
query <- paste0("INSERT INTO `autoreport` VALUES ('", tmp_json, "');")


Sys.setenv(R_LIBCURL_SSL_REVOKE_BEST_EFFORT=TRUE)
install.packages("ggplot2")
devtools::install("../rapadm/.", upgrade = FALSE, dependencies = FALSE)

# enten
rapadm::run_app()
# eller

source("dev/sysSetenv.R")
shiny::shinyApp(ui = rapadm::app_ui, server = rapadm::app_server, options = list(launch.browser = TRUE))

