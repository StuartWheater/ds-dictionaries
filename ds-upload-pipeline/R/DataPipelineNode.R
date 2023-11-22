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
            private$name                     <- name
            private$dataPipelineNodePrevious <- NULL
            private$dataPipelineNodeNext     <- NULL
        },

        print = function()
        {
            cat("DataPipelineNode: ", private$name, "\n", sep = "")
        },

        addAfter = function(dataPipelineNode)
        {
            dataPipelineNode$setDataPipelineNodePrevious(self)
            dataPipelineNode$setDataPipelineNodeNext(private$dataPipelineNodeNext)
            private$dataPipelineNodeNext <- dataPipelineNode
        },

        setDataPipelineNodePrevious = function(newDataPipelineNodePrevious)
        {
            private$dataPipelineNodePrevious <- newDataPipelineNodePrevious
        },

        setDataPipelineNodeNext = function(newDataPipelineNodeNext)
        {
            private$dataPipelineNodeNext <- newDataPipelineNodeNext
        },

        startDataProcessing = function(data)
        {
            self$nextProcessData(data)
        },

        processData = function(data)
        {
            cat("No 'processData' in sub-class")
        },

        nextProcessData = function(data)
        {
            newData <- self$processData(data)
            if (! is.null(private$dataPipelineNodeNext))
                private$dataPipelineNodeNext$nextProcessData(newData)
        }
    ),

    private = list
    (
        name                     = NULL,
        dataPipelineNodePrevious = NULL,
        dataPipelineNodeNext     = NULL
    )
)
