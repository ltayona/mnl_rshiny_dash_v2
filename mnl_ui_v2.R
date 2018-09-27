ui <- dashboardPage(
  
  # Skin Color
  skin = "blue",
  title = "COE-UBR-MNL METRICS",
  
  # Dashboard Header
  dashboardHeader( title = tags$a( tags$head(tags$style(HTML(".name { color: white }"))),
                                   tags$img(src= ('uber.png'), height='50', width='50',align="left"),
                                   'Manila COE Metrics',
                                   class="name"),
                   titleWidth = 350),    
  
  
  # Sidebar
  sidebar = dashboardSidebar(
    width = 250,
    
    # Main Tabs
    sidebarMenu(id = "tab_name",
                
                tags$hr(),
                menuItem("METRIC DEFINITIONS", tabName = "faq", icon = icon("file")),
                
                tags$hr(),
                menuItem("Customer", tabName="Customer",icon=icon("user"),
                         
                         menuSubItem("SUMMARY", tabName = "Overview", icon = icon("window-maximize")),
                         menuSubItem("CSAT", tabName = "CSAT", icon = icon("thumbs-up")),
                         menuSubItem("R2", tabName = "R2", icon = icon("check")),
                         menuSubItem("RESOLUTION EFFICIENCY",tabName = "Reseff", icon = icon("hourglass")),
                         menuSubItem("SOLVES", tabName = "Solved", icon = icon("archive")),
                         menuSubItem("BLISS APH", tabName = "APH", icon = icon("ticket")),
                         menuSubItem("LIVEOPS AHT", tabName = "AHT", icon = icon("hourglass"))
                         
                ),
                
                tags$hr(),
                menuItem("Queue Health", tabName="Queue Health",icon=icon("envelope"),
                         
                         menuSubItem("SUMMARY", tabName = "queue", icon = icon("window-maximize")),
                         menuSubItem("Inflows", tabName = "Inflows", icon = icon("ticket")),
                         menuSubItem("Outflows", tabName = "Outflows", icon = icon("archive")),
                         menuSubItem("Service Level", tabName = "SLA", icon = icon("hourglass"))
                         
                ),
                         
                tags$hr(),
                menuItem("People", tabName="People",icon=icon("users"), 
                         
                        menuSubItem("Shrinkage", tabName = "Shrinkage", icon = icon("alarm-clock")),
                        menuSubItem("Headcount", tabName = "Headcount", icon = icon("users"))
                         
                )         
                
    ),
    hr(),
    # contact info
    textOutput('info'),
    tags$style(type='text/css', "#info { width:100%; margin-top: 20px; margin-left: 5px}")
    
    
    
    
  ),
  
  body = dashboardBody(
    
    
    tabItems(
      
      tabItem(tabName="faq",
              h2("Metrics"),
              fluidRow(box(width = 12,title = "Definitions", status="primary",DT::dataTableOutput("faq"),solidHeader = TRUE, collapsible = T, collapsed = F))
              
      ),
      tabItem(tabName="Overview",
              h2("Summary"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        # Input Boxes for Overview            
                                        conditionalPanel(
                                          #tags$style(type='text/css', ".selectize-input { font-size: 32px; line-height: 32px;} .selectize-dropdown { font-size: 20px; line-height: 20px; }"),
                                          condition = "input.tab_name == 'Overview'",
                                          selectInput(width=1900,
                                                      "Overview_level_filter_type", 
                                                      label = "Select a view to filter data by Site/  LOB / TL / CSR: ",
                                                      choices = c('Site', 'LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,
                                                      "Overview_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          
                                          
                                          
                                          dateRangeInput(width=400,
                                                         "Overview_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period')
                                          
                                          
                                        )
                           )
                           
                           
                           #box(width=3,h4(textOutput('Overview_LOB')),title="LOB/Manager",status="primary",solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE),
                           
                           ),
                          
                          fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,
                                      fluidRow(box(width = 4, highchartOutput("oCSAT_plot")),
                                               box(width = 4, highchartOutput("oR2_plot")),
                                               box(width = 4, highchartOutput("oReseff_plot"))
                                               ),
                                      fluidRow(box(width = 4, highchartOutput("oSolved_plot")),
                                               box(width = 4, highchartOutput("oAPH_plot")),
                                               box(width = 4, highchartOutput("oAHT_plot"))
                                               ),
                                      collapsible = T, collapsed = F
                           )),
                           fluidRow(column(width = 12, downloadButton('downloadData_Overview', 'Click here to Download csv'),align="right"),
                            fluidRow(box(width = 12, title = "Overview", status="primary" ,solidHeader = TRUE, DT::dataTableOutput("Overview_table"), collapsible = T, collapsed = F))
                                        )
                           
                           )
                       
                       )
              
              ),
      
      
      
      
      tabItem(tabName="CSAT",
              h2("Customer Satisfaction"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for CSAT
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'CSAT'",
                                          
                                          selectInput(width=1900,
                                                      "CSAT_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "CSAT_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "CSAT_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_CSAT')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("CSAT_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_CSAT', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "CSAT 2.0", status="primary",solidHeader = TRUE, DT::dataTableOutput("CSAT_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="R2",
              h2("R2 Score"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for R2
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'R2'",
                                          
                                          selectInput(width=1900,
                                                      "R2_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "R2_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "R2_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_R2')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("R2_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_R2', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "R2 Score", status="primary",solidHeader = TRUE, DT::dataTableOutput("R2_table"), collapsible = T, collapsed = F))
              ))),
      tabItem(tabName="Reseff",
              h2("Resolution Efficiency"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Reseff
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Reseff'",
                                          
                                          selectInput(width=1900,
                                                      "Reseff_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "Reseff_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "Reseff_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_Reseff')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("Reseff_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Reseff', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Resolution Efficiency", status="primary",solidHeader = TRUE, DT::dataTableOutput("Reseff_table"), collapsible = T, collapsed = F))
              ))),
      tabItem(tabName="Solved",
              h2("Solves"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for CSAT
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Solved'",
                                          
                                          selectInput(width=1900,
                                                      "Solved_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "Solved_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "Solved_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_Solved')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("Solved_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Solved', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Solves", status="primary",solidHeader = TRUE, DT::dataTableOutput("Solved_table"), collapsible = T, collapsed = F))
              ))),
      tabItem(tabName="APH",
              h2("Bliss APH"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for CSAT
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'APH'",
                                          
                                          selectInput(width=1900,
                                                      "APH_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "APH_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "APH_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_APH')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("APH_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_APH', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Bliss APH", status="primary",solidHeader = TRUE, DT::dataTableOutput("APH_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="AHT",
              h2("LiveOps AHT"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for CSAT
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'AHT'",
                                          
                                          selectInput(width=1900,
                                                      "AHT_level_filter_type", 
                                                      label = "Select a view to filter data by Site/ LOB / TL / CSR: ",
                                                      choices = c('Site','LOB', 'TL','CSR'),
                                                      selected = 'Site'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "AHT_inside_filter",
                                                      label = "Site",
                                                      choices = c("Site"),
                                                      selected = 'Site'
                                          ),
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "AHT_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_AHT')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("AHT_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_AHT', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "LiveOps AHT", status="primary",solidHeader = TRUE, DT::dataTableOutput("AHT_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="Inflows",
              h2("Inflows"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Inflow
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Inflows'",
                                          
                                          selectInput(width=1900,
                                                      "inf_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "inf_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "inf_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_inf')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("inf_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Inflows', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Inflows", status="primary",solidHeader = TRUE, DT::dataTableOutput("inf_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="Outflows",
              h2("Outflows"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Inflow
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Outflows'",
                                          
                                          selectInput(width=1900,
                                                      "out_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "out_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "out_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_out')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("out_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Outflows', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Outflows", status="primary",solidHeader = TRUE, DT::dataTableOutput("out_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="SLA",
              h2("Service Level"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for SLA
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'SLA'",
                                          
                                          selectInput(width=1900,
                                                      "SLA_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "SLA_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "SLA_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_SLA')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("SLA_6h_plot"), collapsible = T, collapsed = F)),
                           #fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("SLA_24h_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_SLA', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Service Level", status="primary",solidHeader = TRUE, DT::dataTableOutput("SLA_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="Shrinkage",
              h2("Shrinkage"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Shrinkage
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Shrinkage'",
                                          
                                          selectInput(width=1900,
                                                      "shr_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "shr_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "shr_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_shr')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("shr_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Shrinkage', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Shrinkage", status="primary",solidHeader = TRUE, DT::dataTableOutput("shr_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="Headcount",
              h2("Headcount"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Headcount
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'Headcount'",
                                          
                                          selectInput(width=1900,
                                                      "hc_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "hc_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "hc_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_hc')
                                        )
                           )),
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("hc_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_Headcount', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Headcount", status="primary",solidHeader = TRUE, DT::dataTableOutput("hc_table"), collapsible = T, collapsed = F))
              ))),
      
      tabItem(tabName="queue",
              h2("Summary"),
              fluidRow(box(width = 12,
                           fluidRow(box(width = 12, title = "Conditions", status="primary" ,solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,
                                        
                                        # Input Boxes for Queue Overview
                                        
                                        conditionalPanel(
                                          
                                          condition = "input.tab_name == 'queue'",
                                          
                                          selectInput(width=1900,
                                                      "queue_level_filter_type", 
                                                      label = "Select a view to filter data by LOB: ",
                                                      choices = 'LOB',
                                                      selected = 'LOB'
                                          ),
                                          
                                          selectInput(width=1900,multiple=TRUE,
                                                      "queue_inside_filter",
                                                      label = "Site",
                                                      choices = c("LOB"),
                                                      selected = 'LOB'
                                          ),
                                          
                                          #textOutput('multiselect_2'),
                                          dateRangeInput(width=400,
                                                         "queue_date", 
                                                         label = "Select Week Range: ",
                                                         start = last_4_week_start_date,
                                                         end = last_week_end_date,                    
                                                         format = "yyyy-mm-dd"
                                          ), 
                                          textOutput('data_time_period_queue')
                                        )
                           )),
                           
                           
                           fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,
                                        fluidRow(box(width = 4, highchartOutput("oinf_plot")),
                                                box(width = 4, highchartOutput("oout_plot")),         
                                                box(width = 4, highchartOutput("oSLA_6h_plot"))      
                                        ),
                                        collapsible = T, collapsed = F
                           )),
                           
                           #fluidRow(box(width = 12, title = "Charts", status="primary" ,solidHeader = TRUE,highchartOutput("qsum_plot"), collapsible = T, collapsed = F)),
                           fluidRow(column(width = 12, downloadButton('downloadData_queue', 'Click here to Download csv'),align="right"),
                                    box(width = 12, title = "Overview", status="primary",solidHeader = TRUE, DT::dataTableOutput("queue_table"), collapsible = T, collapsed = F))
              )))
      
      
      
      
      
      
      
    )
    
  )
  
  
)
