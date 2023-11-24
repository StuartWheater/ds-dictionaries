#'
#' Data Pipeline Node R6Class
#'
#' `DataPipelineNode` is an R6Class which support the generic methods for managing a pipeline.
#'

DataPipelineNode <- R6Class("DataPipelineNode",
    public = list
    (
        initialize = function(name)
        {
            private$name <- name
        },

        print = function()
        {
            cat("DataPipelineNode: ", private$name, "\n", sep = "")
        },

        processData = function(data)
        {
            stop("No 'processData' in sub-class", call. = FALSE)
        }
    ),

    private = list
    (
        name = NULL
    )
)
