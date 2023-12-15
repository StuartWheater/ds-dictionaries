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

            private$config <- config
        },

        processData = function(data)
        {
            columnNameColumnName <- private$config$columnNameColumnName
            rowNameColumnName    <- private$config$rowNameColumnName
            valueColumnName      <- private$config$valueColumnName

            results <- data.frame()
            for (index in 1:nrow(data))
            {
                row <- data[index,]

                columnName <- toString(row[columnNameColumnName])
                rowName    <- toString(row[rowNameColumnName])
                value      <- toString(row[valueColumnName])

                results[rowName, columnName] <- value
            }

            invisible(results)
        }
    ),

    private = list
    (
        config = NULL
    )
)
