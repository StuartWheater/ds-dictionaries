#'
#' @title Validater Data Pipeline Node R6Class
#' 
#' @description `ValidaterDataPipelineNode` is an R6Class which support the validating of data which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#' 

ValidaterDataPipelineNode <- R6Class("ValidaterDataPipelineNode",
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
            cat("ValidaterDataPipelineNode::processData\n")

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
