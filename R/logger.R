#' Settings for logging as json
#'
#' @export
#'
logger_setup <- function() {
  logger::log_threshold(logger::INFO)
  formatter_json <- function(level, message, ...) {
    shinyproxy_username <- Sys.getenv("SHINYPROXY_USERNAME", unset = "unknown")
    appid <- Sys.getenv("FALK_APP_ID", unset = "unknown")
    return(jsonlite::toJSON(
      list(
        time = format(Sys.time(), "%Y-%m-%d %H:%M:%OS3"),
        level = attr(level, "level"),
        app = appid,
        user = shinyproxy_username,
        message = message),
      auto_unbox = TRUE
    )
    )
  }
  logger::log_layout(formatter_json)
  logger::log_messages(); logger::log_warnings(); logger::log_errors()
}
