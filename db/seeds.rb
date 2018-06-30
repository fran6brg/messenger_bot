# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


consumerKey = "vRpODl64Nnb3UsbpFcEiqLH1X"
consumerSecret = "MDyF1EVkoBfKBJhy1L9f0asEeCBqudFe2t66AwS53xpgr8ndBL"
accessToken = "910596684647985152-83GBHVYxQQ4tX4ijVHOVh9bFTwVb0Ru"
accessTokenSecret = "DjSHXl4feOS7bmn6aDLasLEaTaF2uZ67jAcLFs42jT6M0"
client = Twitter::REST::Client.new { |config| config.consumer_key = consumerKey ; config.consumer_secret = consumerSecret ; config.access_token = accessToken ; config.access_token_secret = accessTokenSecret }
TwitterHelper.search_for("macron")

# The number of tweets to return per page, up to a max of 100.
# The page number (starting at 1) to return, up to a max of roughly 1500 results (based on rpp * page).
# Also Twitter provides results up to last 7 days window, not more than that.
client.search("macron", result_type: "recent").first(100).collect { |tweet| puts tweet ; puts tweet.text ; puts tweet.metadata ; puts tweet.user ; puts tweet.source? ; puts tweet.place ; puts tweet.full_text }


