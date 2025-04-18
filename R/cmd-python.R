#' Python is a programming language that lets you work quickly and integrate
#' systems more effectively.
#'
#' @param ... `r rd_dots("python")`.
#' @param python `r rd_cmd("python")`.
#' @seealso
#' - <https://www.python.org/>
#'
#' `r rd_seealso()`
#' @inherit exec return
#' @family command
#' @export
python <- make_command(
    "python",
    function(..., python = NULL) {
        assert_string(python, allow_empty = FALSE, allow_null = TRUE)
        Python$new(cmd = python, ...)
    }
)

Python <- R6Class(
    "Python",
    inherit = Command,
    private = list(
        alias = function() c("python", "python3", "python2"),
        setup_help_params = function() "--help"
    )
)
