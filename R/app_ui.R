#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    navbarPage(title = "Test Golem",
               theme = bslib::bs_theme(primary = "#599faa",
                                       secondary = "#95a3a5",
                                       version = 4,
                                       bootswatch = "united")),
    navlistPanel(
      id = "categories",
      widths = c(2, 10),
      tabPanel("Home",
               p("Hello World")
      ),
      mod_categoryPanel_ui("R"),
      mod_categoryPanel_ui("Python"),
      mod_categoryPanel_ui("Stan")
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(ext = "png"),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'testGolem'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

