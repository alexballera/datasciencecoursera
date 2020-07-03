# Apis

myapp = oauth_app("twitter",
                  key="",
                  secret="")
sig = sign_oauth1.0(myapp,
                    token="",
                    token_secret="")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

homeTL

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]