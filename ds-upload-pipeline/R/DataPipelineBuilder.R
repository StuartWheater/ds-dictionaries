#'
#' @title Data Pipeline Builder function
#' 
#' @description `dataPipelineBuilder` builds and processes a pipeline of data processing nodes.
#' 
#' @details
#' TODO
#'
#' @export
#'

dataPipelineBuilder <- function()
{
    cat("Starting\n")

#    configFilename <- "config.json"
    configFilename <- "config_alt.json"
    #    base::commandArgs(trailingOnly = TRUE)

    config       <- .loadAndValidateConfig(configFilename)
    dataPipeline <- .buildDataPipeline(config)
    
    data <- NULL
    
    for (node in dataPipeline)
    {
        data <- node$processData(data)
        gc()
    }
    
    cat("Ending\n")
}

.loadAndValidateConfig <- function(configFilename)
{
    config <- rjson::fromJSON(file = configFilename)

    return(config)
}

.buildDataPipelineNode <- function(config)
{
    dataPipeline <- switch (config$type,
        LoaderDataPipelineNode       = LoaderDataPipelineNode$new(config$name, config$config),
        SummaryDataPipelineNode      = SummaryDataPipelineNode$new(config$name, config$config),
        ValidaterDataPipelineNode    = ValidaterDataPipelineNode$new(config$name, config$config),
        FromLongLongDataPipelineNode = FromLongLongDataPipelineNode$new(config$name, config$config),
        UploaderDataPipelineNode     = UploaderDataPipelineNode$new(config$name, config$config),
        stop("Unknown data pipeline node type", call. = FALSE)
    )
    return(dataPipeline)
}

.buildDataPipeline <- function(config)
{
    return(lapply(config, .buildDataPipelineNode))
}

