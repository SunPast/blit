#' Strelka is a fast and accurate small variant caller optimized for analysis of germline variation 
#' in small cohorts and somatic variation in tumor/normal sample pairs. 
#'
#' @param script Name of the Strelka script. One of
#' `r oxford_comma(code_quote(StrelkaScripts))`.
#' @param ... `r rd_dots("strelka")`.
#' @inheritParams python
#' @seealso 
#' - <https://github.com/Illumina/strelka>
#' 
#' `r rd_seealso()`
#' @inherit exec return
#' @family command
#' @export
strelka <- make_command(
  "strelka",
  function(script, ..., python = NULL) {
    script <- rlang::arg_match0(script, StrelkaScripts)
    Strelka$new(cmd = python, ..., script = script)
  }
)

Strelka <- R6Class(
  "Strelka",
  inherit = Python,
  private = list(
    combine_params = function(script) {
      script <- pkg_extdata("Strelka", paste0(script, ".py"))
      file_executable(script)
      c(script, super$combine_params())
    }
  )
)

StrelkaScripts <- c(
  "configureStrelkaGermlineWorkflow", "configureStrelkaSomaticWorkflow","runWorkflow"
)