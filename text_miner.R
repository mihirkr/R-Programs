install.packages('tm')
library(tm)

# Load the data
allWork <- read.csv("will_play_text.csv", stringsAsFactors = FALSE)

#Setting up source and corpus
text_source <- VectorSource(allWork)
corpus <- Corpus(text_source)

# Cleaning
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

# Making a document-term matrix
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)

# Finding the most frequent terms
frequency <- colSums(dtm2)
frequency <- sort(frequency, decreasing = TRUE)

install.packages('wordcloud')
library(wordcloud)

words <- names(frequency)
wordcloud(words[1:100], frequency[1:100],colors = 'red')
