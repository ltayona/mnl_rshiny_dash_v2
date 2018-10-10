server <- function(input, output, session) {
  
  
  # Defining Filtered Data

  site_data_diff_filter<-site_data_diff
  lob_data_diff_filter<-lob_data_diff
  tl_data_diff_filter<-tl_data_diff
  agent_data_diff_filter<-agent_data_diff
  inflows_data_filter<-inflows_data
  outflows_data_filter<-outflows_data
  people_data_filter<-people_data
  SLA_data_filter<-SLA_data
  BOP_data_diff_filter<-BOP_data_diff
  
  
  ##highcharter theme
  newtheme <- hc_theme_merge(
    getOption("highcharter.theme"),
    #hc_theme_darkunica(),
    hc_theme(

      colors = c("#276EF1","#47B275","#73A6FC","#263139","#5593FC","#47B275","#BEE4C2","#7356BF","#A89ECB"),

      chart = list(
        backgroundColor = "#F6F6F6",
        gridlinesColor = "#47B275"
      ),
      title = list(
        style = list(
          color = '#000000',
          fontFamily = "Helvetica",
          font = 'bold 12px'

      colors = c("#0074D9","#047878","#FFB733","#F57336","#7E827A"),
      
      #colors = c('red', 'green', 'blue'),
      chart = list(
        backgroundColor = "#000000"
      ),
      title = list(
        style = list(
          color = '#FFFFFF',
          fontFamily = "Helvetica"

        )
      ),
      subtitle = list(
        style = list(
          color = '#666666',

          fontFamily = "Helvetica",
          font = 'bold 12px'

          fontFamily = "Helvetica"

        )
      ),
      legend = list(
        itemStyle = list(
          fontFamily = 'Helvetica',

          color = '#000000'
        ),
        
          
      

          color = '#FFFFFF'
        ),
        

        # xAxis = list(
        #   itemStyle = list(
        #     fontFamily = 'Helvetica',
        #     color = '#000000'
        #   ),
        #   
        # yAxis = list(
        #   itemStyle = list(
        #     fontFamily = 'Helvetica',
        #     color = '#000000'
        #   ),
            
        
        itemHoverStyle = list(
          fontFamily = 'Helvetica',
          color = 'gray'
        )   
      )
      
      )
  )

  
  options(highcharter.theme = newtheme) #setting theme as default
  
  #multi select option
  output$multiselect_1 <- renderText({ 
    paste("Note: Multiple select option is available. Please select accordingly for comparitive analysis.")
  })
  output$multiselect_2 <- renderText({ 
  })
  output$multiselect_3 <- renderText({ 
    paste("Note: Multiple select option is available. Please select accordingly for comparitive analysis.")
  })
  output$multiselect_4 <- renderText({ 
    paste("Note: Multiple select option is available. Please select accordingly for comparitive analysis.")
  })
  
  
  
  #############################################################################################################################
  # Date range notice
  
  
  output$data_time_period_solved <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  
  output$data_time_period_CSAT <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_R2 <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_Reseff <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_APH <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_AHT <- renderText({ 
    paste("Note: Data is available from       ","'", from_date, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_inf <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_out <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_SLA <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_shr <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_hc <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
  output$data_time_period_queue <- renderText({ 
    paste("Note: Data is available from       ","'", first_week, "'", "to              ","'", end_date, "'")
  })
 
  #############################################################################################################################
  # contact notice
  output$info<- renderText({ 
    paste("For any questions/concerns, please reach out to one of the following: ")
  })
  
  
  

  
  #############################################################################################################################
  ## Download button
  #############################################################################################################################
  # Overview Tab download button
  output$downloadData_Overview <- downloadHandler(
    filename = function() {
      paste('Metrics_Overview', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(Overview_table(), con)
    })
  
  # Solved Tab download button
  output$downloadData_Solved <- downloadHandler(
    filename = function() {
      paste('Metrics_Solved', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(Solved_table()[,c(1,2,3)], con)
    })
  
  # CSAT Tab download button
  output$downloadData_CSAT <- downloadHandler(
    filename = function() {
      paste('Metrics_CSAT', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(CSAT_table()[,c(1,2,5,6)], con)
    })
  
  # R2 Tab download button
  output$downloadData_R2 <- downloadHandler(
    filename = function() {
      paste('Metrics_R2', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(R2_table()[,c(1,2,10,11)], con)
    }) 
  
  # TPH Tab download button
  output$downloadData_TPH <- downloadHandler(
    filename = function() {
      paste('Metrics_TPH', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(TPH_table()[,c(1,2,12,13)], con)
    })
  # FCR Tab download button
  output$downloadData_Reseff <- downloadHandler(
    filename = function() {
      paste('Metrics_Reseff', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(Reseff_table()[,c(1,2,8,9)], con)
    })
  
 # AHT Tab download button
  output$downloadData_AHT <- downloadHandler(
    filename = function() {
      paste('Metrics_AHT', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(AHT_table()[,c(1,2,18,19)], con)
    })
  
  # Inflow Tab download button
  output$downloadData_Inflows <- downloadHandler(
    filename = function() {
      paste('Metrics_Inflows', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(inf_table()[,c(1,2,3,4,5)], con)
    })
  
  # Outflow Tab download button
  output$downloadData_Outflows <- downloadHandler(
    filename = function() {
      paste('Metrics_Outflows', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(out_table()[,c(1,2,3,4,5)], con)
    })
  
  # SLA Tab download button
  output$downloadData_SLA <- downloadHandler(
    filename = function() {
      paste('Metrics_SLA', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(SLA_table()[,c(1,2,3,4)], con)
    })
  
  # Queue Summary Tab download button
  output$downloadData_queue <- downloadHandler(
    filename = function() {
      paste('Queue_Overview', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(qsum_table()[,c(1,2,3,4,5,6,7,8,9,10)], con)
    })
  
  # Shrinkage Tab download button
  output$downloadData_Shrinkage <- downloadHandler(
    filename = function() {
      paste('Metrics_Shrinkage', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(shr_table()[,c(1,2,3,4,5)], con)
    })
  
  # Headcount Tab download button
  output$downloadData_Headcount <- downloadHandler(
    filename = function() {
      paste('Metrics_Headcount', Sys.Date(), '.csv', sep='')
    },
    content = function(con) {
      write.csv(hc_table()[,c(1,2,6,7)], con)
    })

  #############################################################################################################################
  ## Metrics Definition Tab
  #############################################################################################################################
  #metric definition
  
  output$faq <- DT::renderDataTable({DT::datatable(defs, options = list(scrollX = TRUE, pageLength=15,
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:2)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}"))) %>% formatCurrency(columns=c(3,4),currency = "", interval = 3, mark = ",", digits = 0)%>% formatStyle(columns = c(1,2,3), 'text-align' = 'left')
  })
  
  
  
  #############################################################################################################################
  ## CSAT Tab
  #############################################################################################################################
  
  # Conditional Input Boxes for CSAT 
  
  observe({
    if(input$CSAT_level_filter_type == 'Site'){
      
      updateSelectInput(session, "CSAT_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$CSAT_level_filter_type == 'LOB'){
              
              updateSelectInput(session, "CSAT_inside_filter",
                                label = "Select LOB: ",
                                choices = lob_choices,
                                selected = 'All'
              )} else
                
                if(input$CSAT_level_filter_type == 'TL'){
                  
                  updateSelectInput(session, "CSAT_inside_filter",
                                    label = "Select TL: ",
                                    choices = tl_choices,
                                    selected = tl_choices[1]
                                    
                  )} else               
                    
                    if(input$CSAT_level_filter_type == 'CSR'){
                      
                      updateSelectInput(session, "CSAT_inside_filter",
                                        label = "Select CSR: ",
                                        choices = agent_choices,
                                        selected = agent_choices[1]
                                        
                      )}
    
  })
  
  # CSAT reactive table
  CSAT_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$CSAT_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
                                               as.Date(Week) >= input$CSAT_date[1] &
                                                as.Date(Week) <= input$CSAT_date[2] )
    }

    else if (input$CSAT_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$CSAT_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$CSAT_date[1] &
                                              as.Date(Week) <= input$CSAT_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$CSAT_inside_filter &
                                                   as.Date(Week) >= input$CSAT_date[1] &
                                                   as.Date(Week) <= input$CSAT_date[2] )  
    
    }
    else if (input$CSAT_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$CSAT_inside_filter &
                                                as.Date(Week) >= input$CSAT_date[1] &
                                                as.Date(Week) <= input$CSAT_date[2])
      
    }
    else if (input$CSAT_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$CSAT_inside_filter &
                                                  as.Date(Week) >= input$CSAT_date[1] &
                                                  as.Date(Week) <= input$CSAT_date[2])  
    }
  })
  
  output$CSAT_table <- DT::renderDataTable({DT::datatable(CSAT_table()[,c(1,2,5,6,7)],
                                                          options = list(scrollX = TRUE, pageLength=10,
                                                                         
                                                                         columnDefs = list(list(className = 'dt-center', targets = 0:4)),
                                                                         initComplete = JS(
                                                                           "function(settings, json) {",
                                                                           "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                           "}")))%>% formatCurrency(columns=c(3,4),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$CSAT_plot <- renderHighchart({
    
    
    if(input$CSAT_inside_filter=="All" & input$CSAT_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(CSAT_table(), "line", hcaes(x = Week , y = Actual_CSAT, group = LOB))}
    else if(length(input$CSAT_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(CSAT_table(), "line",name="Actual", hcaes(x = Week , y = Actual_CSAT)) %>%
        hc_add_series(CSAT_table(), "line",name="Target", hcaes(x = Week , y = Target_CSAT))} 
    
    else if(input$CSAT_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(CSAT_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= LOB))}
    else if(input$CSAT_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(CSAT_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= TL))}
    else if(input$CSAT_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(CSAT_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= Agent_Email))}
  })
  
  
#############################################################################################################################
## R2 Tab
#############################################################################################################################
  
  # Conditional Input Boxes for R2 
  
  observe({
    if(input$R2_level_filter_type == 'Site'){
      
      updateSelectInput(session, "R2_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$R2_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "R2_inside_filter",
                            label = "Select LOB: ",
                            choices = lob_choices,
                            selected = 'All'
          )} else
            
            if(input$R2_level_filter_type == 'TL'){
              
              updateSelectInput(session, "R2_inside_filter",
                                label = "Select TL: ",
                                choices = tl_choices,
                                selected = tl_choices[1]
                                
              )} else               
                
                if(input$R2_level_filter_type == 'CSR'){
                  
                  updateSelectInput(session, "R2_inside_filter",
                                    label = "Select CSR: ",
                                    choices = agent_choices,
                                    selected = agent_choices[1]
                                    
                  )}
    
  })
  
  # R2 reactive table
  R2_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$R2_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
        as.Date(Week) >= input$R2_date[1] &
          as.Date(Week) <= input$R2_date[2] )
    }
    
    else if (input$R2_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$R2_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$R2_date[1] &
                                              as.Date(Week) <= input$R2_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$R2_inside_filter &
                                                   as.Date(Week) >= input$R2_date[1] &
                                                   as.Date(Week) <= input$R2_date[2] )  
      
    }
    else if (input$R2_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$R2_inside_filter &
                                                as.Date(Week) >= input$R2_date[1] &
                                                as.Date(Week) <= input$R2_date[2])
      
    }
    else if (input$R2_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$R2_inside_filter &
                                              as.Date(Week) >= input$R2_date[1] &
                                              as.Date(Week) <= input$R2_date[2])  
    }
  })
  
  output$R2_table <- DT::renderDataTable({DT::datatable(R2_table()[,c(1,2,8,9,10)],
                                                        options = list(scrollX = TRUE, pageLength=10,
                                                                       
                                                                       columnDefs = list(list(className = 'dt-center', targets = 0:4)),
                                                                       initComplete = JS(
                                                                         "function(settings, json) {",
                                                                         "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                         "}")))%>% formatCurrency(columns=c(3,4),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$R2_plot <- renderHighchart({
    
    
    if(input$R2_inside_filter=="All" & input$R2_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(R2_table(), "line", hcaes(x = Week , y = Actual_R2, group = LOB))}
    else if(length(input$R2_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(R2_table(), "line",name="Actual", hcaes(x = Week , y = Actual_R2)) %>%
        hc_add_series(R2_table(), "line",name="Target", hcaes(x = Week , y = Target_R2))} 
    
    else if(input$R2_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(R2_table(), "line", hcaes(x = Week , y = Actual_R2, group= LOB))}
    else if(input$R2_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(R2_table(), "line", hcaes(x = Week , y = Actual_R2, group= TL))}
    else if(input$R2_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(R2_table(), "line", hcaes(x = Week , y = Actual_R2, group= Agent_Email))}
  })
  
  #############################################################################################################################
  ## Reseff Tab
  #############################################################################################################################
  
  # Conditional Input Boxes for Reseff 
  
  observe({
    if(input$Reseff_level_filter_type == 'Site'){
      
      updateSelectInput(session, "Reseff_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$Reseff_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "Reseff_inside_filter",
                            label = "Select LOB: ",
                            choices = lob_choices,
                            selected = 'All'
          )} else
            
            if(input$Reseff_level_filter_type == 'TL'){
              
              updateSelectInput(session, "Reseff_inside_filter",
                                label = "Select TL: ",
                                choices = tl_choices,
                                selected = tl_choices[1]
                                
              )} else               
                
                if(input$Reseff_level_filter_type == 'CSR'){
                  
                  updateSelectInput(session, "Reseff_inside_filter",
                                    label = "Select CSR: ",
                                    choices = agent_choices,
                                    selected = agent_choices[1]
                                    
                  )}
    
  })
  
  # Reseff reactive table
  Reseff_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$Reseff_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
        as.Date(Week) >= input$Reseff_date[1] &
          as.Date(Week) <= input$Reseff_date[2] )
    }
    
    else if (input$Reseff_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$Reseff_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$Reseff_date[1] &
                                              as.Date(Week) <= input$Reseff_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$Reseff_inside_filter &
                                                   as.Date(Week) >= input$Reseff_date[1] &
                                                   as.Date(Week) <= input$Reseff_date[2] )  
      
    }
    else if (input$Reseff_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$Reseff_inside_filter &
                                                as.Date(Week) >= input$Reseff_date[1] &
                                                as.Date(Week) <= input$Reseff_date[2])
      
    }
    else if (input$Reseff_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$Reseff_inside_filter &
                                              as.Date(Week) >= input$Reseff_date[1] &
                                              as.Date(Week) <= input$Reseff_date[2])  
    }
  })
  
  output$Reseff_table <- DT::renderDataTable({DT::datatable(Reseff_table()[,c(1,2,14,15,16)],
                                                            options = list(scrollX = TRUE, pageLength=10,
                                                                           
                                                                           columnDefs = list(list(className = 'dt-center', targets = 0:4)),
                                                                           initComplete = JS(
                                                                             "function(settings, json) {",
                                                                             "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                             "}")))%>% formatCurrency(columns=c(3,4),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$Reseff_plot <- renderHighchart({
    
    
    if(input$Reseff_inside_filter=="All" & input$Reseff_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Reseff_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group = LOB))}
    else if(length(input$Reseff_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Reseff_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Resolution_Efficiency)) %>%
        hc_add_series(Reseff_table(), "line",name="Target", hcaes(x = Week , y = Target_Resolution_Efficiency))} 
    
    else if(input$Reseff_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Reseff_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= LOB))}
    else if(input$Reseff_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Reseff_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= TL))}
    else if(input$Reseff_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Reseff_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= Agent_Email))}
  })
  
  #############################################################################################################################
  ## Solves Tab
  #############################################################################################################################
  
  # Conditional Input Boxes for Solves 
  
  observe({
    if(input$Solved_level_filter_type == 'Site'){
      
      updateSelectInput(session, "Solved_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$Solved_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "Solved_inside_filter",
                            label = "Select LOB: ",
                            choices = lob_choices,
                            selected = 'All'
          )} else
            
            if(input$Solved_level_filter_type == 'TL'){
              
              updateSelectInput(session, "Solved_inside_filter",
                                label = "Select TL: ",
                                choices = tl_choices,
                                selected = tl_choices[1]
                                
              )} else               
                
                if(input$Solved_level_filter_type == 'CSR'){
                  
                  updateSelectInput(session, "Solved_inside_filter",
                                    label = "Select CSR: ",
                                    choices = agent_choices,
                                    selected = agent_choices[1]
                                    
                  )}
    
  })
  
  # Solved reactive table
  Solved_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$Solved_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
        as.Date(Week) >= input$Solved_date[1] &
          as.Date(Week) <= input$Solved_date[2] )
    }
    
    else if (input$Solved_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$Solved_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$Solved_date[1] &
                                              as.Date(Week) <= input$Solved_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$Solved_inside_filter &
                                                   as.Date(Week) >= input$Solved_date[1] &
                                                   as.Date(Week) <= input$Solved_date[2] )  
      
    }
    else if (input$Solved_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$Solved_inside_filter &
                                                as.Date(Week) >= input$Solved_date[1] &
                                                as.Date(Week) <= input$Solved_date[2])
      
    }
    else if (input$Solved_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$Solved_inside_filter &
                                              as.Date(Week) >= input$Solved_date[1] &
                                              as.Date(Week) <= input$Solved_date[2])  
    }
  })
  
  output$Solved_table <- DT::renderDataTable({DT::datatable(Solved_table()[,c(1,2,3)],
                                                            options = list(scrollX = TRUE, pageLength=10,
                                                                           
                                                                           columnDefs = list(list(className = 'dt-center', targets = 0:3)),
                                                                           initComplete = JS(
                                                                             "function(settings, json) {",
                                                                             "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                             "}")))%>% formatCurrency(columns=c(3),currency = "", interval = 3, mark = ",", digits = 0)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$Solved_plot <- renderHighchart({
    
    
    if(input$Solved_inside_filter=="All" & input$Solved_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Solved_table(), "line", hcaes(x = Week , y = Actual_Solved, group = LOB))}
    else if(length(input$Solved_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Solved_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Solved))}
    # hc_add_series(Solved_table(), "line",name="Target", hcaes(x = Week , y = Target_Resolution_Efficiency))} 
    
    else if(input$Solved_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Solved_table(), "line", hcaes(x = Week , y = Actual_Solved, group= LOB))}
    else if(input$Solved_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Solved_table(), "line", hcaes(x = Week , y = Actual_Solved, group= TL))}
    else if(input$Solved_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Solved_table(), "line", hcaes(x = Week , y = Actual_Solved, group= Agent_Email))}
  })
  
  #############################################################################################################################
  ## Bliss APH Tab
  #############################################################################################################################
  
  # Conditional Input Boxes for Bliss APH 
  
  observe({
    if(input$APH_level_filter_type == 'Site'){
      
      updateSelectInput(session, "APH_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$APH_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "APH_inside_filter",
                            label = "Select LOB: ",
                            choices = lob_choices,
                            selected = 'All'
          )} else
            
            if(input$APH_level_filter_type == 'TL'){
              
              updateSelectInput(session, "APH_inside_filter",
                                label = "Select TL: ",
                                choices = tl_choices,
                                selected = tl_choices[1]
                                
              )} else               
                
                if(input$APH_level_filter_type == 'CSR'){
                  
                  updateSelectInput(session, "APH_inside_filter",
                                    label = "Select CSR: ",
                                    choices = agent_choices,
                                    selected = agent_choices[1]
                                    
                  )}
    
  })
  
  # APH reactive table
  APH_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$APH_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
        as.Date(Week) >= input$APH_date[1] &
          as.Date(Week) <= input$APH_date[2] )
    }
    
    else if (input$APH_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$APH_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$APH_date[1] &
                                              as.Date(Week) <= input$APH_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$APH_inside_filter &
                                                   as.Date(Week) >= input$APH_date[1] &
                                                   as.Date(Week) <= input$APH_date[2] )  
      
    }
    else if (input$APH_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$APH_inside_filter &
                                                as.Date(Week) >= input$APH_date[1] &
                                                as.Date(Week) <= input$APH_date[2])
      
    }
    else if (input$APH_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$APH_inside_filter &
                                              as.Date(Week) >= input$APH_date[1] &
                                              as.Date(Week) <= input$APH_date[2])  
    }
  })
  
  output$APH_table <- DT::renderDataTable({DT::datatable(APH_table()[,c(1,2,11,12,13)],
                                                         options = list(scrollX = TRUE, pageLength=10,
                                                                        
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:4)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}")))%>% formatCurrency(columns=c(3:5),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$APH_plot <- renderHighchart({
    
    
    if(input$APH_inside_filter=="All" & input$APH_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(APH_table(), "line", hcaes(x = Week , y = Actual_APH, group = LOB))}
    else if(length(input$APH_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(APH_table(), "line",name="Actual", hcaes(x = Week , y = Actual_APH)) %>%
        hc_add_series(APH_table(), "line",name="Target", hcaes(x = Week , y = Target_APH))} 
    
    else if(input$APH_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(APH_table(), "line", hcaes(x = Week , y = Actual_APH, group= LOB))}
    else if(input$APH_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(APH_table(), "line", hcaes(x = Week , y = Actual_APH, group= TL))}
    else if(input$APH_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(APH_table(), "line", hcaes(x = Week , y = Actual_APH, group= Agent_Email))}
  })
  
  #############################################################################################################################
  ## LiveOps AHT Tab
  #############################################################################################################################
  
  # Conditional Input Boxes for LiveOps AHT 
  
  observe({
    if(input$AHT_level_filter_type == 'Site'){
      
      updateSelectInput(session, "AHT_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
        if(input$AHT_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "AHT_inside_filter",
                            label = "Select LOB: ",
                            choices = lob_choices,
                            selected = 'All'
          )} else
            
            if(input$AHT_level_filter_type == 'TL'){
              
              updateSelectInput(session, "AHT_inside_filter",
                                label = "Select TL: ",
                                choices = tl_choices,
                                selected = tl_choices[1]
                                
              )} else               
                
                if(input$AHT_level_filter_type == 'CSR'){
                  
                  updateSelectInput(session, "AHT_inside_filter",
                                    label = "Select CSR: ",
                                    choices = agent_choices,
                                    selected = agent_choices[1]
                                    
                  )}
    
  })
  
  # AHT reactive table
  AHT_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$AHT_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter( 
        as.Date(Week) >= input$AHT_date[1] &
          as.Date(Week) <= input$AHT_date[2] )
    }
    
    else if (input$AHT_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$AHT_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$AHT_date[1] &
                                              as.Date(Week) <= input$AHT_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$AHT_inside_filter &
                                                   as.Date(Week) >= input$AHT_date[1] &
                                                   as.Date(Week) <= input$AHT_date[2] )  
      
    }
    else if (input$AHT_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$AHT_inside_filter &
                                                as.Date(Week) >= input$AHT_date[1] &
                                                as.Date(Week) <= input$AHT_date[2])
      
    }
    else if (input$AHT_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(Agent_Email %in% input$AHT_inside_filter &
                                              as.Date(Week) >= input$AHT_date[1] &
                                              as.Date(Week) <= input$AHT_date[2])  
    }
  })
  
  output$AHT_table <- DT::renderDataTable({DT::datatable(AHT_table()[,c(1,2,17,18,19)],
                                                         options = list(scrollX = TRUE, pageLength=10,
                                                                        
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:5)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}")))%>% formatCurrency(columns=c(3:5),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$AHT_plot <- renderHighchart({
    
    
    if(input$AHT_inside_filter=="All" & input$AHT_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(AHT_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group = LOB))}
    else if(length(input$AHT_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(AHT_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Liveops_AHT)) %>%
        hc_add_series(AHT_table(), "line",name="Target", hcaes(x = Week , y = Target_Liveops_AHT))} 
    
    else if(input$AHT_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(AHT_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= LOB))}
    else if(input$AHT_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(AHT_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= TL))}
    else if(input$AHT_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(AHT_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= Agent_Email))}
  })
  
  #############################################################################################################################
  ## Overview Tab
  #############################################################################################################################
  
  #overview filter conditions
  
  observe({
    if(input$Overview_level_filter_type == 'Site'){
      
      updateSelectInput(session, "Overview_inside_filter",
                        label = "COE-UBR-MNL ",
                        choices = "Site",
                        selected = 'Site'
      )} else
        
            
            if(input$Overview_level_filter_type == 'LOB'){
              
              updateSelectInput(session, "Overview_inside_filter",
                                label = "Select LOB: ",
                                choices = lob_choices,
                                selected = 'All'
              )} else
                
                if(input$Overview_level_filter_type == 'TL'){
                  
                  updateSelectInput(session, "Overview_inside_filter",
                                    label = "Select TL: ",
                                    choices = tl_choices
                                    
                  )} else               
                    
                    if(input$Overview_level_filter_type == 'CSR'){
                      
                      updateSelectInput(session, "Overview_inside_filter",
                                        label = "Select CSR: ",
                                        choices = agent_choices
                                        
                      )}
    
  })
  
  # Overview reactive table
  Overview_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    agent_data_diff=copy(agent_data_diff_filter)
    lob_data_diff = copy(lob_data_diff_filter)
    tl_data_diff = copy(tl_data_diff_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    if(input$Overview_level_filter_type=='Site'){
      data_result <- site_data_diff_filter
      data_result <- data_result %>% filter(  
                                                as.Date(Week) >= input$Overview_date[1] &
                                                as.Date(Week) <= input$Overview_date[2] )
    }

     
        
      
    else if (input$Overview_level_filter_type=='LOB'){
      data_result <- lob_data_diff_filter
      if(input$Overview_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$Overview_date[1] &
                                              as.Date(Week) <= input$Overview_date[2] )
        
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$Overview_inside_filter &
                                                   as.Date(Week) >= input$Overview_date[1] &
                                                   as.Date(Week) <= input$Overview_date[2] )  
      
     
    }
    else if (input$Overview_level_filter_type=='TL'){
      data_result <- tl_data_diff_filter
      data_result <- data_result %>% filter(  TL %in% input$Overview_inside_filter &
                                                as.Date(Week) >= input$Overview_date[1] &
                                                as.Date(Week) <= input$Overview_date[2])

    }
    else if (input$Overview_level_filter_type=='CSR'){
      data_result <- agent_data_diff_filter
      data_result <- data_result %>% filter(    Agent_Email %in% input$Overview_inside_filter &
                                                  as.Date(Week) >= input$Overview_date[1] &
                                                  as.Date(Week) <= input$Overview_date[2])
    }
  })
  
  #output overview table
  output$Overview_table <- DT::renderDataTable({DT::datatable(Overview_table()[,c(1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)],extensions = c('FixedColumns'),
                                                              options = list(scrollX = TRUE, pageLength=10,fixedColumns = list(leftColumns = 3),
                                                                             columnDefs = list(list(className = 'dt-center', targets = 0:6)),
                                                                             initComplete = JS(
                                                                               "function(settings, json) {",
                                                                               "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                               "}")))%>%formatPercentage(columns=c(13,14,15),2)%>% formatCurrency(columns=c(3),currency = "", interval = 3, mark = ",", digits = 0)%>%formatCurrency(columns=c(4,5,6,7,8,9,10,11,12,16,17,18),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:2), 'text-align' = 'left') %>% 
      formatStyle(
        c(3,7,8,9,13,14,15,19,20,21,25),
        backgroundColor ='#F5F5F5')%>% formatStyle(columns=c(6,9,12,15), color = styleInterval(cuts=c(-0.15,0.0000001), values=c("#FF0000","#BDB76B","#008000")))%>% formatStyle(columns=c(18,21,24), color = styleInterval(cuts=c(-0.000001,0.15), values=c("#008000","#BDB76B","#FF0000")))%>% formatStyle(columns = c(3:30), 'text-align' = 'center')
    
    
  })
  
  # charts
  output$oAHT_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Liveops_AHT)) %>%
        hc_add_series(Overview_table(), "line",name="Target", hcaes(x = Week , y = Target_Liveops_AHT))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly AHT") %>%
        hc_yAxis(title = list(text = "AHT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Liveops_AHT, group= Agent_Email))}
  })
  
  output$oCSAT_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_CSAT, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_CSAT)) %>%
        hc_add_series(Overview_table(), "line",name="Target", hcaes(x = Week , y = Target_CSAT))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly CSAT 2.0") %>%
        hc_yAxis(title = list(text = "CSAT"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_CSAT, group= Agent_Email))}
  })
  
  # charts
  output$oR2_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_R2, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_R2)) %>%
        hc_add_series(Overview_table(), "line",name="Target", hcaes(x = Week , y = Target_R2))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_R2, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_R2, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly R2") %>%
        hc_yAxis(title = list(text = "R2"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_R2, group= Agent_Email))}
  })
  
  output$oReseff_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Resolution_Efficiency)) %>%
        hc_add_series(Overview_table(), "line",name="Target", hcaes(x = Week , y = Target_Resolution_Efficiency))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Resolution Efficiency") %>%
        hc_yAxis(title = list(text = "Reseff"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Resolution_Efficiency, group= Agent_Email))}
  })
  
  output$oSolved_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Solved, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Solved))}
    # hc_add_series(Solved_table(), "line",name="Target", hcaes(x = Week , y = Target_Resolution_Efficiency))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Solved, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Solved, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Solves") %>%
        hc_yAxis(title = list(text = "Solves"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_Solved, group= Agent_Email))}
  })
  
  output$oAPH_plot <- renderHighchart({
    
    
    if(input$Overview_inside_filter=="All" & input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_APH, group = LOB))}
    else if(length(input$Overview_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line",name="Actual", hcaes(x = Week , y = Actual_APH)) %>%
        hc_add_series(Overview_table(), "line",name="Target", hcaes(x = Week , y = Target_APH))} 
    
    else if(input$Overview_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_APH, group= LOB))}
    else if(input$Overview_level_filter_type=="TL"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_APH, group= TL))}
    else if(input$Overview_level_filter_type=="CSR"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly APH") %>%
        hc_yAxis(title = list(text = "APH"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(Overview_table(), "line", hcaes(x = Week , y = Actual_APH, group= Agent_Email))}
  })

  #############################################################################################################################
  ## Queue Health Data Tab
  #############################################################################################################################
  
  
  ## Inflows Data Tab
  
  # Conditional Input Boxes for Inflows
  observe({

        if(input$inf_level_filter_type == 'LOB'){
          
          updateSelectInput(session, "inf_inside_filter",
                            label = "Select LOB: ",
                            choices = inf_lob_choices,
                            selected = 'All'
          )} 
    
  })
  
  # Inflows reactive table
  inf_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    inf_lob_data_diff = copy(inflows_data_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
      
      if (input$inf_level_filter_type=='LOB'){
      data_result <- inflows_data_filter
      if(input$inf_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$inf_date[1] &
                                              as.Date(Week) <= input$inf_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$inf_inside_filter &
                                                   as.Date(Week) >= input$inf_date[1] &
                                                   as.Date(Week) <= input$inf_date[2] )  
      
    }
    
    
  })
  
  output$inf_table <- DT::renderDataTable({DT::datatable(inf_table()[,c(1,2,3,4,5)],
                                                         options = list(scrollX = TRUE, pageLength=10,
                                                                        
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:5)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}")))%>% formatCurrency(columns=c(3:5),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$inf_plot <- renderHighchart({
    
    
    if(input$inf_inside_filter=="All" & input$inf_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(inf_table(), "line", hcaes(x = Week , y = Actual_Inflows, group = LOB))}
    else if(length(input$inf_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(inf_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Inflows)) %>%
        hc_add_series(inf_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Inflows))} 
    
    else if(input$inf_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(inf_table(), "line", hcaes(x = Week , y = Actual_Inflows, group= LOB))}
    
  })
  
  ## Outflows Data Tab
  
  # Conditional Input Boxes for Outflows
  observe({
    
    if(input$out_level_filter_type == 'LOB'){
      
      updateSelectInput(session, "out_inside_filter",
                        label = "Select LOB: ",
                        choices = out_lob_choices,
                        selected = 'All'
      )} 
    
  })
  
  # Outflows reactive table
  out_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    out_lob_data_diff = copy(outflows_data_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    
    if (input$out_level_filter_type=='LOB'){
      data_result <- outflows_data_filter
      if(input$out_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$out_date[1] &
                                              as.Date(Week) <= input$out_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$out_inside_filter &
                                                   as.Date(Week) >= input$out_date[1] &
                                                   as.Date(Week) <= input$out_date[2] )  
      
    }
    
    
  })
  
  output$out_table <- DT::renderDataTable({DT::datatable(out_table()[,c(1,2,3,4,5)],
                                                         options = list(scrollX = TRUE, pageLength=10,
                                                                        
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:5)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}")))%>% formatCurrency(columns=c(3:5),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$out_plot <- renderHighchart({
    
    
    if(input$out_inside_filter=="All" & input$out_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(out_table(), "line", hcaes(x = Week , y = Actual_Outflows, group = LOB))}
    else if(length(input$out_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(out_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Outflows)) %>%
        hc_add_series(out_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Outflows))} 
    
    else if(input$out_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(out_table(), "line", hcaes(x = Week , y = Actual_Outflows, group= LOB))}
    
  })
  
  ## SLA Data Tab
  
  # Conditional Input Boxes for SLa
  observe({
    
    if(input$SLA_level_filter_type == 'LOB'){
      
      updateSelectInput(session, "SLA_inside_filter",
                        label = "Select LOB: ",
                        choices = SLA_lob_choices,
                        selected = 'All'
      )} 
    
  })
  
  # SLA reactive table
  SLA_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    SLA_lob_data_diff = copy(SLA_data_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    
    if (input$SLA_level_filter_type=='LOB'){
      data_result <- SLA_data_filter
      if(input$SLA_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$SLA_date[1] &
                                              as.Date(Week) <= input$SLA_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$SLA_inside_filter &
                                                   as.Date(Week) >= input$SLA_date[1] &
                                                   as.Date(Week) <= input$SLA_date[2] )  
      
    }
    
    
  })
  
  output$SLA_table <- DT::renderDataTable({DT::datatable(SLA_table()[,c(1,2,4,5)],
                                                        options = list(scrollX = TRUE, pageLength=10,
                                                                       
                                                                       columnDefs = list(list(className = 'dt-center', targets = 0:3)),
                                                                       initComplete = JS(
                                                                         "function(settings, json) {",
                                                                         "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                         "}")))%>% formatCurrency(columns=c(2:3),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$SLA_6h_plot <- renderHighchart({
    
    
    if(input$SLA_inside_filter=="All" & input$SLA_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly 6H SLA") %>%
        hc_yAxis(title = list(text = "6H SLA")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(SLA_table(), "line", hcaes(x = Week , y = first_response_6H, group = LOB))
      }
    else if(length(input$SLA_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly SLA") %>%
        hc_yAxis(title = list(text = "SLA"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(SLA_table(), "line",name="6H First Response", hcaes(x = Week , y = first_response_6H)) %>%
        hc_add_series(SLA_table(), "line",name="24H First Response", hcaes(x = Week , y = first_response_24H))} 
    
    else if(input$SLA_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly 6H SLA") %>%
        hc_yAxis(title = list(text = "SLA")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(SLA_table(), "line", hcaes(x = Week , y = first_response_6H, group= LOB)) }
  
  })
  
output$SLA_24h_plot <- renderHighchart({
  
  
  if(input$SLA_inside_filter=="All" & input$SLA_level_filter_type=="LOB"){
    highchart() %>%
      hc_chart(zoomType = "x") %>%
      hc_title(text = "Weekly 24H SLA") %>%
      hc_yAxis(title = list(text = "SLA")) %>%
      hc_tooltip(crosshairs = T, shared = T) %>%
      hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
      hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
      hc_add_series(SLA_table(), "line", hcaes(x = Week , y = first_response_24H, group = LOB))}
  else if(length(input$SLA_inside_filter)==1){
    highchart() %>%
      hc_chart(zoomType = "x") %>%
      hc_title(text = "Weekly SLA") %>%
      hc_yAxis(title = list(text = "SLA"),min=0) %>%
      hc_tooltip(crosshairs = T, shared = T) %>%
      hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
      hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
      hc_add_series(SLA_table(), "line",name="6H First Response", hcaes(x = Week , y = first_response_6H)) %>%
      hc_add_series(SLA_table(), "line",name="24H First Response", hcaes(x = Week , y = first_response_24H))} 
  
  else if(input$SLA_level_filter_type=="LOB"){
    highchart() %>%
      hc_chart(zoomType = "x") %>%
      hc_title(text = "Weekly 24H SLA") %>%
      hc_yAxis(title = list(text = "SLA"),min=0) %>%
      hc_tooltip(crosshairs = T, shared = T) %>%
      hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
      hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
      hc_add_series(SLA_table(), "line", hcaes(x = Week , y = first_response_24H, group= LOB))}
  
})
  
  
  ## Shrinkage Data Tab
  
  # Conditional Input Boxes for Shrinkage
  observe({
    
    if(input$shr_level_filter_type == 'LOB'){
      
      updateSelectInput(session, "shr_inside_filter",
                        label = "Select LOB: ",
                        choices = peo_lob_choices,
                        selected = 'All'
      )} 
    
  })
  
  # Shrinkage reactive table
  shr_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    shr_lob_data_diff = copy(people_data_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    
    if (input$shr_level_filter_type=='LOB'){
      data_result <- people_data_filter
      if(input$shr_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$shr_date[1] &
                                              as.Date(Week) <= input$shr_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$shr_inside_filter &
                                                   as.Date(Week) >= input$shr_date[1] &
                                                   as.Date(Week) <= input$shr_date[2] )  
      
    }
    
    
  })
  
  output$shr_table <- DT::renderDataTable({DT::datatable(shr_table()[,c(1,2,3,4,5)],
                                                         options = list(scrollX = TRUE, pageLength=10,
                                                                        
                                                                        columnDefs = list(list(className = 'dt-center', targets = 0:5)),
                                                                        initComplete = JS(
                                                                          "function(settings, json) {",
                                                                          "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                          "}")))%>% formatCurrency(columns=c(3:5),currency = "", interval = 3, mark = ",", digits = 2)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$shr_plot <- renderHighchart({
    
    
    if(input$shr_inside_filter=="All" & input$shr_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Shrinkage") %>%
        hc_yAxis(title = list(text = "Shrinkage")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(shr_table(), "line", hcaes(x = Week , y = Actual_Shrinkage, group = LOB))}
    else if(length(input$shr_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Shrinkage") %>%
        hc_yAxis(title = list(text = "Shrinkage"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(shr_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Shrinkage)) %>%
        hc_add_series(shr_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Shrinkage))} 
    
    else if(input$shr_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Shrinkage") %>%
        hc_yAxis(title = list(text = "Shrinkage"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(shr_table(), "line", hcaes(x = Week , y = Actual_Shrinkage, group= LOB))}
    
  })
  
  # Conditional Input Boxes for Headcount
  observe({
    
    if(input$hc_level_filter_type == 'LOB'){
      
      updateSelectInput(session, "hc_inside_filter",
                        label = "Select LOB: ",
                        choices = peo_lob_choices,
                        selected = 'All'
      )} 
    
  })
  
  # Headcount reactive table
  hc_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    hc_lob_data_diff = copy(people_data_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    
    if (input$hc_level_filter_type=='LOB'){
      data_result <- people_data_filter
      if(input$hc_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$hc_date[1] &
                                              as.Date(Week) <= input$hc_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$hc_inside_filter &
                                                   as.Date(Week) >= input$hc_date[1] &
                                                   as.Date(Week) <= input$hc_date[2] )  
      
    }
    
    
  })
  
  output$hc_table <- DT::renderDataTable({DT::datatable(hc_table()[,c(1,2,6,7)],
                                                            options = list(scrollX = TRUE, pageLength=10,
                                                                           
                                                                           columnDefs = list(list(className = 'dt-center', targets = 0:3)),
                                                                           initComplete = JS(
                                                                             "function(settings, json) {",
                                                                             "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                             "}")))%>% formatCurrency(columns=c(4),currency = "", interval = 3, mark = ",", digits = 0)%>% formatStyle(columns = c(1:20), 'text-align' = 'center')
  })
  
  # charts
  output$hc_plot <- renderHighchart({
    
    
    if(input$hc_inside_filter=="All" & input$hc_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Headcout") %>%
        hc_yAxis(title = list(text = "Headcount")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(hc_table(), "line", hcaes(x = Week , y = Actual_Headcount, group = LOB))}
    else if(length(input$hc_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Headcount") %>%
        hc_yAxis(title = list(text = "Headcount"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(hc_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Headcount)) %>%
        hc_add_series(hc_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Headcount))} 
    
    else if(input$hc_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Headcount") %>%
        hc_yAxis(title = list(text = "Headcount"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(hc_table(), "line", hcaes(x = Week , y = Actual_Headcount, group= LOB))}
    
  })
  
  # Conditional Input Boxes for Queue Summary
  observe({
    
    if(input$queue_level_filter_type == 'LOB'){
      
      updateSelectInput(session, "queue_inside_filter",
                        label = "Select LOB: ",
                        choices = peo_lob_choices,
                        selected = 'All'
      )} 
    
  })
  
  # Queue Summary reactive table
  queue_table<- reactive({
    site_data_diff=copy(site_data_diff_filter)
    qsum_lob_data_diff = copy(BOP_data_diff_filter)
    
    
    # Subsetting respective data based on selected Site/LOB/TL/Agent
    
    if (input$queue_level_filter_type=='LOB'){
      data_result <- BOP_data_diff_filter
      if(input$queue_inside_filter=='All'){
        data_result<-data_result %>% filter(as.Date(Week) >= input$queue_date[1] &
                                              as.Date(Week) <= input$queue_date[2] )
        
      }
      else data_result <- data_result %>% filter(LOB %in% input$queue_inside_filter &
                                                   as.Date(Week) >= input$queue_date[1] &
                                                   as.Date(Week) <= input$queue_date[2] )  
      
    }
    
    
  })
  
  output$queue_table <- DT::renderDataTable({DT::datatable(queue_table()[,c(1,2,3,4,5,6,7,8,9,10)],
                                                        options = list(scrollX = TRUE, pageLength=10,
                                                                       
                                                                       columnDefs = list(list(className = 'dt-center', targets = 0:3)),
                                                                       initComplete = JS(
                                                                         "function(settings, json) {",
                                                                         "$(this.api().table().header()).css({'background-color': '#333333', 'color': '#fff'});",
                                                                         "}")))%>% formatCurrency(columns=c(2:8),currency = "", interval = 3, mark = ",", digits = 0)%>% formatStyle(columns = c(1:20), 'text-align' = 'center') %>%
      formatStyle(
        c(3,6,9,10),
        backgroundColor ='#F5F5F5')%>% formatStyle(columns=c(5,8), color = styleInterval(cuts=c(-0.15,0.0000001), values=c("#FF0000","#BDB76B","#008000")))%>% formatStyle(columns = c(3:10), 'text-align' = 'center')
  })
  
  
  
  # charts
  output$oinf_plot <- renderHighchart({
    
    
    if(input$queue_inside_filter=="All" & input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = Actual_Inflows, group = LOB))}
    else if(length(input$queue_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Inflows)) %>%
        hc_add_series(queue_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Inflows))} 
    
    else if(input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Inflow") %>%
        hc_yAxis(title = list(text = "Inflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = Actual_Inflows, group= LOB))}
    
  })
  
  
  # charts
  output$oout_plot <- renderHighchart({
    
    
    if(input$queue_inside_filter=="All" & input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = Actual_Outflows, group = LOB))}
    else if(length(input$queue_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line",name="Actual", hcaes(x = Week , y = Actual_Outflows)) %>%
        hc_add_series(queue_table(), "line",name="Forecast", hcaes(x = Week , y = Forecasted_Outflows))} 
    
    else if(input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly Outflow") %>%
        hc_yAxis(title = list(text = "Outflow"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = Actual_Outflows, group= LOB))}
    
  })
  
  output$oSLA_6h_plot <- renderHighchart({
    
    
    if(input$queue_inside_filter=="All" & input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly 6H SLA") %>%
        hc_yAxis(title = list(text = "SLA")) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = first_response_6H, group = LOB))}
    else if(length(input$queue_inside_filter)==1){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly SLA") %>%
        hc_yAxis(title = list(text = "SLA"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line",name="6H First Response", hcaes(x = Week , y = first_response_6H)) %>%
        hc_add_series(queue_table(), "line",name="24H First Response", hcaes(x = Week , y = first_response_24H))} 
    
    else if(input$queue_level_filter_type=="LOB"){
      highchart() %>%
        hc_chart(zoomType = "x") %>%
        hc_title(text = "Weekly 6H SLA") %>%
        hc_yAxis(title = list(text = "SLA"),min=0) %>%
        hc_tooltip(crosshairs = T, shared = T) %>%
        hc_subtitle(text = list('Highlight along the x-axis to zoom; Click Legends to enable/disable')) %>%
        hc_xAxis(type = "datetime", dateTimeLabelFormats = list(day = '%e of %b')) %>%
        hc_add_series(queue_table(), "line", hcaes(x = Week , y = first_response_6H, group= LOB))}
    
  })
  
  
  
  
  
  
  
}