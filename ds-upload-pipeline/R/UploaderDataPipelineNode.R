#'
#' @title Uploader Data Pipeline Node R6Class
#' 
#' @description `UploaderDataPipelineNode` is an R6Class which support the uploading of data which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#'

UploaderDataPipelineNode <- R6Class("UploaderDataPipelineNode",
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
            cat("UploaderDataPipelineNode::processData\n")

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
