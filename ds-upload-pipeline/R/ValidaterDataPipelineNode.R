#'
#' @title Validater Data Pipeline Node R6Class
#' 
#' @description `ValidaterDataPipelineNode` is an R6Class which support the validating of data which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#'
#' @export
#'

ValidaterDataPipelineNode <- R6Class("ValidaterDataPipelineNode",
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
            columnSpecs <- private$config$columnSpecs

            for (columnName in colnames(data))
            {
                matchingColumnNamePattern <- FALSE
                for (index in 1:length(columnSpecs))
                {
                    columnSpec        <- columnSpecs[[index]]
                    columnNamePattern <- columnSpec$columnNamePattern[1]

                    if (stringi::stri_detect(str = columnName, regex = columnNamePattern))
                    {
                        valuePattern <- columnSpec$valuePattern[1]

                        valueMismatches <- unique(setdiff(data[[columnName]], stringi::stri_match(str = data[[columnName]], regex = valuePattern)))

                        if (length(valueMismatches) != 0)
                            stop("Value pattern mismatche(s) in column \"", columnName, "\": \"", paste0(valueMismatches, sep = ", "), "\"", call. = FALSE)

                        matchingColumnNamePattern <- TRUE
                    }
                }

                if (! matchingColumnNamePattern)
                    stop(paste("Unable to find a pattern matching column name \"", columnName, "\"", sep = ""), call. = FALSE)
            }

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
