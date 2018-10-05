##############################################################################################################################
# libraries
###########################################################################################################################

#install.packages(c("googlesheets", "sqldf", "dplyr", "data.table", "shiny", "DT", "shinydashboard", "highcharter"))

#install.pac

library(googlesheets)
library(sqldf)
library(dplyr)
library(data.table)
library(shiny)
library(DT)
#library(htmltools)
#require(DT)
library(shinydashboard)
require(highcharter)
##############################################################################################################################
# reading from googlesheets LOB/Site level
##############################################################################################################################
#setwd("")
options("httr_oob_default" = TRUE)
token <- gs_auth()
saveRDS(token,"googlesheets_token_1.rds")
gs_auth(token="googlesheets_token_1.rds")

# LOB level
lob_level <- gs_title("MNL COE - Project Lighthouse LOB Raw (MDS)")
lob_data <- gs_read(lob_level)

#lob_data$wb <- as.Date(lob_data$wb,"%Y/%m/%d")


# subsetting site level data
site_data<-lob_data[lob_data$line_of_business=="SITE",]
#colnames(site_data)
site_data_diff<-sqldf("Select 
                      performance_week as Week,
                      'COE-UBR-MNL' as Site,
                      (bliss_solves+liveops_solves+jira_solves+zd_solves) as Actual_Solved,
                      (csat_survey + liveops_csat_score) as 'Actual_Responses',
                      round(Target_CSAT,2) as Target_CSAT,
                      round(CSAT,2) as Actual_CSAT,
                      round((CSAT-Target_CSAT),2) as 'CSAT_Delta',
                      round(Target_R2,2) as Target_R2,
                      round(R2,2) as Actual_R2,
                      round((R2-Target_R2),2) as 'R2_Delta',
                      round(Target_APH,2) as 'Target_APH',
                      round(APH,2) as Actual_APH,
                      round((APH-Target_APH),2) as 'APH_Delta',
                      round(Target_Resolution_Efficiency,2) as 'Target_Resolution_Efficiency',
                      round(resolution_efficiency,2) as Actual_Resolution_Efficiency,
                      round((resolution_efficiency-Target_resolution_efficiency),2) as 'Resolution_Efficiency_Delta',
                      round(Target_AHT,2) as Target_Liveops_AHT,
                      round(AHT,2) as Actual_Liveops_AHT,
                      round((AHT-Target_AHT),2) as 'Liveops_AHT_Delta',
                      round(productive_hours,2) as 'productive_hours',
                      efficiency_solve_actions,
                      efficiency_work_actions,
                      (csat_survey + liveops_csat_survey) as 'CSAT_Surveys',
                      qa_total,
                      qa_survey,
                      round(liveops_hours,2) as 'liveops_hours'
                      from site_data"
)

site_data_diff$Week<-as.Date(site_data_diff$Week)

# subsetting site level data
site_data<-lob_data[lob_data$line_of_business=="SITE",]

site_solved_data_diff<-sqldf("Select 
                            
                            performance_week as Week,
                            'COE-UBR-MNL' as Site,
                            bliss_solves as Bliss_Solved,
                            liveops_solves as Liveops_Solved,
                            jira_solves as JIRA_Solved,
                            zd_solves as Zendesk_Solved
                            
                            from lob_data")

site_solved_data_diff$Week<-as.Date(site_solved_data_diff$Week)




#subsetting LOB level data
lob_data<-lob_data[!lob_data$line_of_business %in% c("SITE"),]

lob_data_diff<-sqldf("Select 
                      
                     performance_week as Week,
                     line_of_business as LOB,
                      (bliss_solves+liveops_solves+jira_solves+zd_solves) as Actual_Solved,
                      (csat_survey + liveops_csat_score) as 'Actual_Responses',
                     round(Target_CSAT,2) as Target_CSAT,
                     round(CSAT,2) as Actual_CSAT,
                     round((CSAT-Target_CSAT),2) as 'CSAT_Delta',
                     round(Target_R2,2) as Target_R2,
                     round(R2,2) as Actual_R2,
                     round((R2-Target_R2),2) as 'R2_Delta',
                     round(Target_APH,2) as 'Target_APH',
                     round(APH,2) as Actual_APH,
                     round((APH-Target_APH),2) as 'APH_Delta',
                     round(Target_Resolution_Efficiency,2) as 'Target_Resolution_Efficiency',
                     round(resolution_efficiency,2) as Actual_Resolution_Efficiency,
                     round((resolution_efficiency-Target_resolution_efficiency),2) as 'Resolution_Efficiency_Delta',
                     round(Target_AHT,2) as Target_Liveops_AHT,
                     round(AHT,2) as Actual_Liveops_AHT,
                     round((AHT-Target_AHT),2) as 'Liveops_AHT_Delta',
                     round(productive_hours,2) as 'productive_hours',
                     efficiency_solve_actions,
                     efficiency_work_actions,
                     (csat_survey + liveops_csat_survey) as 'CSAT_Surveys',
                     qa_total,
                     qa_survey,
                     round(liveops_hours,2) as 'liveops_hours'
                     from lob_data"
)
lob_data_diff$Week<-as.Date(lob_data_diff$Week)

#subsetting LOB level data
lob_data<-lob_data[!lob_data$line_of_business %in% c("SITE"),]

lob_solved_data_diff<-sqldf("Select 

                    performance_week as Week,
                    line_of_business as LOB,
                    bliss_solves as Bliss_Solved,
                    liveops_solves as Liveops_Solved,
                    jira_solves as JIRA_Solved,
                    zd_solves as Zendesk_Solved

                    from lob_data")

lob_solved_data_diff$Week<-as.Date(lob_solved_data_diff$Week)

##############################################################################################################################
# cleaning data  LOB/Site level
##############################################################################################################################

# eliminating the unnecessary rows where week or LOB/Manager field is not present to get a clean data
site_data_diff<-site_data_diff[!is.na(site_data_diff$Week),]
site_data_diff<-site_data_diff[!is.na(site_data_diff$Site),]
lob_data_diff<-lob_data_diff[!is.na(lob_data_diff$Week),]
lob_data_diff<-lob_data_diff[!is.na(lob_data_diff$LOB),]


##############################################################################################################################
# reading data from googlesheets data  agent/TL level
##############################################################################################################################
agent_level <- gs_title("MNL COE - Project Lighthouse Agent Raw (MDS)")
agent_data<- gs_read(agent_level)
colnames(agent_data)
agent_data$csat_score<-as.numeric(agent_data$csat_score)
agent_data$csat_survey<- as.numeric(agent_data$csat_survey)
agent_data$efficiency_work_actions<-as.numeric(agent_data$efficiency_work_actions)


tl_data<- sqldf(" select 
                     performance_week as Week, 
                     act_team_lead_email as TL,
                     sum(bliss_solves+liveops_solves+jira_solves+zd_solves) as Actual_Solved,
                     csat_survey as Actual_Responses,
                     avg(Target_CSAT) as Target_CSAT,
                     round(csat_score/csat_survey,2) as Actual_CSAT,
                     avg(Target_R2) as Target_R2,
                     sum(qa_total)/sum(qa_survey) as Actual_R2,
                     avg(Target_APH) as Target_APH,
                     sum(bliss_solves)/sum(productive_hours) as Actual_APH,
                     avg(Target_Resolution_Efficiency) as Target_Resolution_Efficiency,
                     sum(bliss_solves)/sum(efficiency_work_actions) as Actual_Resolution_Efficiency,
                     avg(Target_AHT) as Target_Liveops_AHT,
                     sum(liveops_solves)/sum(liveops_hours) as Actual_Liveops_AHT
                      
                     from agent_data
                     group by 1,2")

tl_data_diff<- sqldf("select 
                     Week, 
                     TL,
                     Actual_Solved,
                     Actual_Responses,
                     round(Target_CSAT,2) as Target_CSAT,
                     round(Actual_CSAT,2) as Actual_CSAT,
                     round((Actual_CSAT - Target_CSAT),2) as CSAT_Delta,
                     round(Target_R2,2) as Target_R2,
                     round(Actual_R2,2) as Actual_R2,
                     round((Actual_R2 - Target_R2),2) as R2_Delta,
                     round(Target_APH,2) as Target_APH,
                     round(Actual_APH,2) as Actual_APH,
                     round((Actual_APH - Target_APH),2) as APH_Delta,
                     round(Target_Resolution_Efficiency,2)as Target_Resolution_Efficiency,
                     round(Actual_Resolution_Efficiency,2) as Actual_Resolution_Efficiency, 
                     round((Actual_Resolution_Efficiency-Target_Resolution_Efficiency),2) as Resolution_Efficiency_Delta,
                     round(Target_Liveops_AHT,2) as Target_Liveops_AHT,
                     round(Actual_Liveops_AHT,2) as Actual_Liveops_AHT,
                     round((Actual_Liveops_AHT-Target_Liveops_AHT),2) as 'Liveops_AHT_Delta'
                      
                     from tl_data
                    ")

tl_data_diff$Week<-as.Date(tl_data_diff$Week)

tl_solved_data_diff<- sqldf("select
                            performance_week as Week, 
                            act_team_lead_email as TL,
                            bliss_solves as Bliss_Solved,
                            liveops_solves as Liveops_Solved,
                            jira_solves as JIRA_Solved,
                            zd_solves as Zendesk_Solved
                            
                            from agent_data")
tl_solved_data_diff$Week<-as.Date(tl_solved_data_diff$Week)

agent_data_diff<-sqldf(" Select
                     performance_week as Week, 
                     agent_email as Agent_Email, 
                     (bliss_solves+liveops_solves+jira_solves+zd_solves) as Actual_Solved,
                     csat_survey as Actual_Responses,
                     round(Target_CSAT,2) as Target_CSAT,
                     round(CSAT,2) as Actual_CSAT,
                     round((CSAT - Target_CSAT),2) as CSAT_Delta,
                     round(Target_R2,2) as Target_R2,
                     round(R2,2) as Actual_R2,
                     round((R2 - Target_R2),2) as R2_Delta,
                     round(Target_APH,2) as Target_APH,
                     round(APH,2) as Actual_APH,
                     round((APH - Target_APH),2) as APH_Delta,
                     round(Target_Resolution_Efficiency,2)  as Target_Resolution_Efficiency,
                     round(resolution_efficiency,2) as Actual_Resolution_Efficiency,
                     round((resolution_efficiency-Target_Resolution_Efficiency),2) as Resolution_Efficiency_Delta,
                     round(Target_AHT,2) as Target_Liveops_AHT,
                     round(AHT,2) as Actual_Liveops_AHT,
                     round((AHT-Target_AHT),2) as 'Liveops_AHT_Delta'
                      
                     from agent_data
                    ")
agent_data_diff$Week<-as.Date(agent_data_diff$Week)

agent_solved_data_diff<- sqldf("select
                            performance_week as Week, 
                            agent_email as Agent_Email,
                            bliss_solves as Bliss_Solved,
                            liveops_solves as Liveops_Solved,
                            jira_solves as JIRA_Solved,
                            zd_solves as Zendesk_Solved
                            
                            from agent_data")
agent_solved_data_diff$Week<-as.Date(agent_solved_data_diff$Week)


##############################################################################################################################
# reading data from googlesheets B&OP Data
##############################################################################################################################
regional_level <- gs_title("MNL COE - Queue Health")
regional_data<- gs_read(regional_level)
colnames(regional_data)
regional_data$wb<-as.character(regional_data$wb)
regional_data$sla_6h<-as.numeric(regional_data$sla_6h)
regional_data$sla_24h<-as.numeric(regional_data$sla_24h)
regional_data$shrinkage_actuals<-as.numeric(regional_data$shrinkage_actuals)
regional_data$shrinkage_forecast<-as.numeric(regional_data$shrinkage_forecast)

BOP_data<- sqldf(" select 
                wb as Week, 
                lob_tag as LOB,
                inflow_actuals as Actual_Inflows,
                inflow_forecast as Forecasted_Inflows,
                outflow_actuals as Actual_Outflows,
                outflow_forecast as Forecasted_Outflows,
                round(sla_6h,2) as 'first_response_6H',
                round(sla_24h,2) as 'first_response_24H',
                headcount_actuals as Actual_Headcount,
                headcount_forecast as Forecasted_Headcount,
                round(shrinkage_actuals,2) as Actual_Shrinkage,
                round(shrinkage_forecast,2) as Forecasted_Shrinkage
                
                from regional_data")

BOP_data_diff<- sqldf("select 
                Week, 
                LOB,
                Actual_Inflows,
                Forecasted_Inflows,
                (Actual_Inflows - Forecasted_Inflows) as Inflows_Delta,
                Actual_Outflows,
                Forecasted_Outflows,
                (Actual_Outflows - Forecasted_Outflows) as Outflows_Delta,
                first_response_6H,
                first_response_24H,
                Actual_Headcount,
                Forecasted_Headcount,
                (Actual_Headcount - Forecasted_Headcount) as Headcount_Delta,
                Actual_Shrinkage,
                Forecasted_Shrinkage,
                (Actual_Shrinkage - Forecasted_Shrinkage) as Shrinkage_Delta
                
                from BOP_data")

BOP_data_diff$Week<-as.Date(BOP_data_diff$Week)
inflows_data<- sqldf ("select
                      Week,
                      LOB,
                      Actual_Inflows,
                      Forecasted_Inflows,
                      Inflows_Delta,
                      first_response_6H,
                      first_response_24H
                      
                      
                      from BOP_data_diff")

inflows_data$Week<-as.Date(inflows_data$Week)
outflows_data<- sqldf  ("select
                        Week,
                        LOB,
                        Actual_Outflows,
                        Forecasted_Outflows,
                        Outflows_Delta,
                        first_response_6H,
                        first_response_24H
                
                        
                        from BOP_data_diff")

outflows_data$Week<-as.Date(outflows_data$Week)
people_data<- sqldf("select
                    Week,
                    LOB,
                    Actual_Shrinkage,
                    Forecasted_Shrinkage,
                    Shrinkage_Delta,
                    Actual_Headcount,
                    Forecasted_Headcount
                    

                    from BOP_data_diff")
people_data$Week<-as.Date(people_data$Week)

SLA_data<- sqldf ("select
                    Week,
                    LOB,
                    Actual_Outflows,
                    first_response_6H,
                    first_response_24H
                    
                    from BOP_data_diff
                    where first_response_6H is not null")
SLA_data$Week<-as.Date(SLA_data$Week)


##############################################################################################################################
# reading data Metric definitions
##############################################################################################################################
Definitions <- gs_title("MNL COE - LOB Metrics")
defs = gs_read(Definitions,ws = 2)


##############################################################################################################################
# filter choices
##############################################################################################################################
lob_choices<-c("All",unique(lob_data_diff$LOB))
tl_choices<-unique(tl_data_diff$TL)
agent_choices<-unique(agent_data_diff$Agent_Email)
inf_lob_choices <- c("All",unique(inflows_data$LOB))
inf_wb_choices <- unique(inflows_data$Week)
out_lob_choices <- c("All",unique(outflows_data$LOB))
out_wb_choices <- unique(outflows_data$Week)
peo_lob_choices <- c("All",unique(people_data$LOB))
peo_wb_choices <- unique(people_data$Week)
SLA_lob_choices <- c("All",unique(SLA_data$LOB))
SLA_wb_choices <- unique(SLA_data$Week)

##############################################################################################################################
# date setting
################################################################################################

# Today's Date
today = as.Date(Sys.time(), format = "%F")
today_dow = wday(as.Date(Sys.time(), format = "%F"))
this_week_start_date = today - today_dow + 2
last_week_end_date_real = this_week_start_date - 1
last_week_start_date = last_week_end_date_real - 6
last_week_end_date=max(as.Date(lob_data_diff$Week))
last_4_week_start_date=last_week_start_date-35 #later changed to 6 weeks
start_month = as.Date(format(today-93,"%Y-%m-01"))
end_month=as.Date(format(today-31,"%Y-%m-01"))
from_date<-min(as.Date(lob_data_diff$Week))
end_date<-last_week_end_date
first_week<-as.Date("2018-01-01")

