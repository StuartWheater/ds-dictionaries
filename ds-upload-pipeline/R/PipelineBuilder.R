#'
#' @title Data Pipeline Builder function
#' 
#' @description `dataPipelineBuilder` builds and processes a pipeline of data processing nodes.
#' 
#' @details
#' TODO
#' 

.loadAndValidateConfig <- function(configFilename)
{
    config = rjson::fromJSON(file = configFilename)

    return(config)
}

.buildDataPipelineNode <- function(config)
{
    dataPipeline <- switch (config$type,
       LoaderDataPipelineNode    = LoaderDataPipelineNode$new(config$name, config$config),
       ValidaterDataPipelineNode = ValidaterDataPipelineNode$new(config$name, config$config),
       UploaderDataPipelineNode  = UploaderDataPipelineNode$new(config$name, config$config),
       stop("Unknown data pipeline node type", call. = FALSE)
    )
    return(dataPipeline)
}

.buildDataPipeline <- function(config)
{
    return(lapply(config, .buildDataPipelineNode))
}

dataPipelineBuilder <- function()
{
    cat("DataPipelineBuilder: starting\n")

    configFilename <- "config.json"
#    base::commandArgs(trailingOnly = TRUE)

    config       <- .loadAndValidateConfig(configFilename)
    dataPipeline <- .buildDataPipeline(config)

    data <- data.frame(a = c(1, 2, 3, 4, 5, 6), b = c(4, 5, 6, 1, 2, 3), b = c(0, 1, 2, 3, 4, 5), d = c(4, 5, 6, 0, 1, 3))

    for (node in dataPipeline)
    {
        cat("Processing node: ", node$name)
        data <- node$processData(data)
        gc()
    }

    cat("DataPipelineBuilder: ending\n")
}
