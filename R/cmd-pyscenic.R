#' Run pyscenic
#'
#' @param subcmd Sub-Command of pyscenic.
#' @param ... `r rd_dots("pyscenic subcmd")`.
#' @param pyscenic `r rd_cmd("pyscenic")`.
#' @inherit exec return
#' @seealso
#' - <https://github.com/aertslab/pySCENIC>
#'
#' `r rd_seealso()`
#' @family command
#' @export
pyscenic <- make_command(
    "pyscenic",
    function(subcmd = NULL, ..., pyscenic = NULL) {
        assert_string(subcmd, allow_empty = FALSE, allow_null = TRUE)
        assert_string(pyscenic, allow_empty = FALSE, allow_null = TRUE)
        Pyscenic$new(cmd = pyscenic, ..., subcmd = subcmd)
    }
)

Pyscenic <- R6Class(
    "Pyscenic",
    inherit = Command,
    private = list(
        alias = function() "pyscenic",
        setup_help_params = function() "--help",
        combine_params = function(subcmd) {
            c(subcmd, super$combine_params())
        }
    )
)
