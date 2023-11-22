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

.buildDataPipeline <- function(config)
{
    loaderDataPipelineNode1    <- LoaderDataPipelineNode$new(config[[1]]$name, config[[1]]$config)
    validaterDataPipelineNode2 <- ValidaterDataPipelineNode$new(config[[2]]$name, config[[2]]$config)
    uploaderDataPipelineNode3  <- UploaderDataPipelineNode$new(config[[3]]$name, config[[3]]$config)
    
    loaderDataPipelineNode1$addAfter(validaterDataPipelineNode2)
    validaterDataPipelineNode2$addAfter(uploaderDataPipelineNode3)
    
    dataPipelineStartNode <- loaderDataPipelineNode1
    
    return(dataPipelineStartNode)
}

dataPipelineBuilder <- function()
{
    cat("DataPipelineBuilder: starting\n")

    configFilename <- "../config.json"
#    base::commandArgs(trailingOnly = TRUE)

    config                <- .loadAndValidateConfig(configFilename)
    dataPipelineStartNode <- .buildDataPipeline(config)

    data <- data.frame(a = c(1, 2, 3, 4, 5, 6), b = c(4, 5, 6, 1, 2, 3), b = c(0, 1, 2, 3, 4, 5), d = c(4, 5, 6, 0, 1, 3))

    dataPipelineStartNode$startDataProcessing(data)

    cat("DataPipelineBuilder: ending\n")
}