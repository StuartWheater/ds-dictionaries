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
        #' @description 
        #' Initialize the object
        #' @param name name of node
        #' @param config config of node
        initialize = function(name, config)
        {
            super$initialize(name)

            private$config <- config
        },

        #' @description 
        #' Process data
        #' @param data data to be processed
        processData = function(data)
        {
            cat("Summary:\n")
            cat("\tColumn Names:\"", colnames(data), "\"\n", sep = " ")
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
