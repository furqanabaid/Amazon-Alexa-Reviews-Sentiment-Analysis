library(Hmisc)
library("plotrix")

alexa_reviews <- read.csv("amazon_alexa.csv")
View(head(alexa_reviews,50))
View(describe(alexa_reviews))
custom_colors <- c("skyblue", "yellowgreen", 'tomato', "blue", "red")
pie(alexa_reviews$rating, labels = rownames(alexa_reviews), col=custom_colors, main = "Alexa Reviews Ratings")
install.packages("plotrix")
draw.circle(0, 0, 0.4, col="white")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(sentimentr, dplyr, magrittr)
sentiment(alexa_reviews$verified_reviews)
temp <- alexa_reviews
i<-1
for(review in temp$verified_reviews)
{
  temp$Sentiment[i] <- sentiment(review)$sentiment
  if(temp$Sentiment[i] > 0)
  {
    temp$category[i] = "Positive"
  }
  else if(temp$Sentiment[i] < 0)
  {
    temp$category[i] = "Negative"
  }
  else if(temp$Sentiment[i] == 0)
  {
    temp$category[i] = "Neutral"
  }
  i<-i+1
}
temp