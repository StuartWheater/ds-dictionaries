#'
#' @title From 'long long' Data Pipeline Node R6Class
#' 
#' @description `FromLongLongDataPipelineNode` is an R6Class which support the conversion from 'long long' format of data which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#'
#' @export
#'


FromLongLongDataPipelineNode <- R6Class("FromLongLongDataPipelineNode",
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
            cat("FromLongLongDataPipelineNode::processData\n")

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
