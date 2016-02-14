library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel(windowTitle = 'Course Project sNcalculator',
                    title       = "sNcalculator"
                    ), 
        sidebarPanel(
            textInput( inputId = 'c',
                       label   = 'Circle of Confusion (mm)',
                       value   = '0.030'
                       ),
            p('You can look up the Circle of Confusion (CoC) for your camera at ',
              a('DoFMaster', HREF = 'http://www.dofmaster.com/digital_coc.html'), 
              ' or if you want to calculate it yourself at ',
              a('Wikipedia', HREF = 'https://en.wikipedia.org/wiki/Circle_of_confusion'),
              '.'
            ),
            sliderInput( inputId = 'f',
                         label   = 'Focal length (mm)',
                         min     = 16,
                         max     = 70,
                         value   = 35
                         ),
            p('The focal lengths of my lenses range from 16 to 70mm. For longer focal lengths, you have to build your own Shiny app ;-)'),
            numericInput( inputId = 'D_N',
                          label   = 'Nearest Distance (m)',
                          value   = 3.5,
                          step    = 0.1
                          ),
            p('Nearest distance of acceptable sharpness.'),
            numericInput( inputId = 'D_F',
                          label   = 'Farthest Distance (m)',
                          value   = 200,
                          step    = 1
            ),
            p('Farthest distance of acceptable sharpness.')
        ),
        mainPanel(
            p(
                'In photography depth of field (DoF) is the distance between the nearest an farthest objects ', 
                'in a scene that appear acceptably sharp in an image (', 
                a('Wikipedia: Depth of Field', HREF = 'https://en.wikipedia.org/wiki/Depth_of_field'),
                '). DoF depends on the Circle of Confusion (CoC), the focal length (f) of the lens, the distance to the subject (s) and aperture (N). '
            ),
            p(
                'In the sidebarpanel on the left you can input CoC, f and the nearest and farthest distances that need to be sharp, ', 
                'sNcalculator will output these values below and calculate s (where you have to focus) and N (the aperture).',
                'Hence the name sNcalculator.'
                ),
            h4('Circle of Confusion (mm):'),
            verbatimTextOutput('c'),
            h4('Focal length (mm):'),
            verbatimTextOutput('f'),
            h4('Nearest Distance of Acceptable Sharpness (m)'),
            verbatimTextOutput('D_N'),
            h4('Farthest Distance of Acceptable Sharpness (m)'),
            verbatimTextOutput('D_F'),
            hr(),
            h4('Subject Distance to Focus at (m):'),
            verbatimTextOutput('s'),
            h4('Maximum Aperture (full stops):'),
            verbatimTextOutput('N')
        )
        )
    )
