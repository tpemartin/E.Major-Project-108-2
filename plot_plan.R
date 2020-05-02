
library(readr); library(dplyr); library(lubridate); library(drake)

drake_plan(
  dataExample = {
    library(readr)
    read_csv("https://apiservice.mol.gov.tw/OdService/download/A17000000J-020067-bVl")
    },
  dataExample1 = {
    library(dplyr)
    dataExample %>%
      mutate(
        受僱員工人數=as.numeric(受僱員工人數)
      )
  },
  plot1={
    library(ggplot2)
    dataExample1 %>%
      ggplot()+
      geom_col(
        aes(x=職類別, y=受僱員工人數)
      )}
  
) -> plot_plan

make(plot_plan)
readd(plot1)
vis_drake_graph(plot_plan) 
