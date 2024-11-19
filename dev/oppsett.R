####################
## Kjøring lokalt ##
####################

devtools::install("../rapbase/.")
devtools::install(upgrade = FALSE, dependencies = FALSE)

source("dev/sysSetenv.R")
# Hvis mobilt kontor
# Sys.setenv(MYSQL_HOST="localhost")

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

