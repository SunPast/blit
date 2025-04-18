#' Run conda
#' @param subcmd Sub-Command of conda.
#' @param ... `r rd_dots("conda")`.
#' @param conda `r rd_cmd("conda")`.
#' @inherit exec return
#' @seealso
#' `r rd_seealso()`
#' @family command
#' @export
conda <- make_command(
    "conda",
    function(subcmd = NULL, ..., conda = NULL) {
        assert_string(subcmd, allow_empty = FALSE, allow_null = TRUE)
        assert_string(conda, allow_empty = FALSE, allow_null = TRUE)
        Conda$new(cmd = conda, ..., subcmd = subcmd)
    }
)

Conda <- R6Class(
    "Conda",
    inherit = Command,
    private = list(
        command_name = function() "conda",
        alias = function() c("micromamba", "mamba", "conda"),
        setup_help_params = function() "--help",
        combine_params = function(subcmd) c(subcmd, super$combine_params())
    )
)
