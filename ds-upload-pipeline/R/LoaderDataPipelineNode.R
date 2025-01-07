#'
#' @title Loader Data Pipeline Node R6Class
#' 
#' @description `LoaderDataPipelineNode` is an R6Class which support the loading of data which passes to the `processData` function of the next node in the pipeline.
#'
#' @details
#' TODO
#'
#' @import readr
#'
#' @export
#'

LoaderDataPipelineNode <- R6Class("LoaderDataPipelineNode",
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
            tsvFilename <- private$config$filename

            data <- readr::read_tsv(tsvFilename, col_names = TRUE, show_col_types = FALSE)

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
