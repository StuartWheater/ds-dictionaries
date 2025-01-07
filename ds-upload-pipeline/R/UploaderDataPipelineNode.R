#'
#' @title Uploader Data Pipeline Node R6Class
#' 
#' @description `UploaderDataPipelineNode` is an R6Class which support the uploading of data which passes to the `processData` function by the previous node in the pipeline.
#' 
#' @details
#' TODO
#'
#' @import MolgenisArmadillo
#'
#' @export
#'

UploaderDataPipelineNode <- R6Class("UploaderDataPipelineNode",
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
            armadilloURL <- private$config$armadilloURL
            username     <- private$config$username
            password     <- private$config$password
            projectName  <- private$config$projectName
            folderName   <- private$config$folderName
            tableName    <- private$config$tableName

            tryCatch(
                {
                    if (is.character(username) && (nchar(username) > 0) && is.character(password) && (nchar(password) > 0))
                        MolgenisArmadillo::armadillo.login_basic(armadillo = armadilloURL, username = username, password = password)
                    else
                        MolgenisArmadillo::armadillo.login(armadillo = armadilloURL)
                    MolgenisArmadillo::armadillo.upload_table(projectName, folderName, data, tableName)
                },
                error = function(error)
                {
                    message("Error: Connecting to Armadillo Server")
                    print(error)
                    stop("Error connecting to Armadillo Server", call. = FALSE)
                },
                warning = function(warning)
                {
                    message("Warning: Connecting to Armadillo Server")
                    print(warning)
                    return(NA)
                }
            )

            invisible(data)
        }
    ),

    private = list
    (
        config = NULL
    )
)
