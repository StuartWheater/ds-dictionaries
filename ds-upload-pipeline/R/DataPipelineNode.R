#'
#' Data Pipeline Node R6Class
#'
#' `DataPipelineNode` is an R6Class which support the generic methods for managing a pipeline.
#'
#' @import R6
#'
#' @export
#'

DataPipelineNode <- R6Class("DataPipelineNode",
    public = list
    (
        #' @description 
        #' Initialize the object
        #' @param name name of node
        initialize = function(name)
        {
            private$name <- name
        },

        #' @description 
        #' Print the object
        #' @param name name of node
        print = function()
        {
            cat("DataPipelineNode: ", private$name, "\n", sep = "")
        },

        #' @description 
        #' Process data
        #' @param data data to be processed
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
