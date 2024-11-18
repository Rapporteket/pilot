# Install necessary packages
Sys.setenv(R_LIBCURL_SSL_REVOKE_BEST_EFFORT=TRUE)
install.packages("log4r")

# Load library
library(log4r)
library(jsonlite)

logger <- logger(appenders = console_appender(json_log_layout()))

# Define JSON formatter function
json_formatter <- function(level, message, ...) {
  shinyproxy_username <- Sys.getenv("SHINYPROXY_USERNAME", unset = "unknown")
  shinyproxy_appid <- Sys.getenv("SHINYPROXY_APPID", unset = "unknown")

  log_record <- list(
    time = format(Sys.time(), "%Y-%m-%d %H:%M:%OS3"),
    level = level,
    app = shinyproxy_appid,
    user = shinyproxy_username,
    message = message
  )
  json_record <- jsonlite::toJSON(log_record, auto_unbox = TRUE)
  cat(json_record, "\n")
}

# Define JSON appender function
json_appender <- function() {
  function(level, message) {
    json_formatter(level, message)
  }
}

# Create logger with JSON appender
json_log <- logger(threshold = "INFO", appenders = list(json_appender()))

# Example log messages
info(json_log, "This is an info message")
warn(json_log, "This is a warning message")
error(json_log, "This is an error message")


