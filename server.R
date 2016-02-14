subject_distance <- function(near_distance,
                             far_distance){
    round(2*near_distance*far_distance/(near_distance + far_distance), 1)
}

aperture <- function(focal_length,
                     circle_of_confusion,
                     near_distance,
                     far_distance){
    apertures <- c(1, 1.4, 2, 2.8, 4, 5.6, 8, 11, 16, 22)
    N <- (focal_length*focal_length/circle_of_confusion) * (far_distance - near_distance) / (2*near_distance*far_distance)/1000
    N <- ifelse(N < 1, 0, max(apertures[apertures <= N]))
    N
}

shinyServer(
    function(input, 
             output
    ){
        output$c   <- renderPrint({input$c})
        output$f   <- renderPrint({input$f})
        output$D_N <- renderPrint({input$D_N})
        output$D_F <- renderPrint({input$D_F})
        output$s   <- renderPrint({subject_distance(input$D_N, 
                                                    input$D_F
                                                    )})
        output$N   <- renderPrint({ aperture(input$f, 
                                             as.numeric(input$c),
                                             input$D_N,
                                             input$D_F
                                             )})
    }
)