#'
#' @title Summary Data Pipeline Node R6Class
#' 
#' @description `SummaryDataPipelineNode` is an R6Class which support the summarising ata which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#'
#' @export
#'

SummaryDataPipelineNode <- R6Class("SummaryDataPipelineNode",
    inherit = DataPipelineNode,

    public = list
    (
        initialize = function(name, config)
        {
            super$initialize(name)

            private$config = config
        },

        processData = function(data)
        {
            cat("Summary:\n")
            cat("\tSummary: ", summary(data), "\n", sep = "")
            cat("\tColumn Names: \"", colnames(data), "\"\n", sep = "")
            cat("\tLength:", nrow(data), "\n", sep = " ")
            cat("\tClass(s):", class(data), "\n", sep = " ")

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
