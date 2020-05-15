plan1 <- drake::drake_plan(
  badEmployers={
    jsonlite::fromJSON("https://data.ntpc.gov.tw/od/data/api/CB6C96C8-D514-42EA-8591-0F4447E79C91?$format=json")
    },
  violatedArticles={
    factor(badEmployers$law)-> badEmployers$law
    levels(badEmployers$law)
  }
)

make(plan1)
