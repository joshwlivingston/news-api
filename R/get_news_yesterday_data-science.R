library(httr2)
library(jsonlite)

yesterday <- Sys.Date() - 1

req <- request("https://newsapi.org/v2/everything") |>
  req_url_query(
    q = '`"data science"`',
    from = yesterday,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )

resp <- req_perform(req)
resp_json <- resp_body_json(resp)

write(req_json, paste0("data/", yesterday, ".json"))
