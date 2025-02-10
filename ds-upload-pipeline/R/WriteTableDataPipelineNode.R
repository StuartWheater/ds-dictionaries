#'
#' @title WriteTable Data Pipeline Node R6Class
#' 
#' @description `WriteTableDataPipelineNode` is an R6Class which support the writing of table data which passes to the `processData` function of the next node in the pipeline.
#'
#' @details
#' TODO
#'
#' @import utils
#'
#' @export
#'

WriteTableDataPipelineNode <- R6Class("WriteTableDataPipelineNode",
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
            print(private$config)
            filename <- private$config$filename

            utils::write.table(x = data, file = filename)

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
