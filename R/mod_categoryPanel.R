#' categoryPanel UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_categoryPanel_ui <- function(id){
  ns = shiny::NS(id)
    tabPanel(glue::glue("{id} page"),
             plotOutput(ns("randomPlot"))
  )
}

#' categoryPanel Server Functions
#'
#' @noRd
mod_categoryPanel_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns = session$ns
    output$randomPlot = renderPlot({
      shinipsum::random_ggplot() +
        ggplot2::ggtitle(glue::glue("A plot about {id}"))
    })
  })
}

