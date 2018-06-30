require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN_FB'])

Bot.on :message do |message|
  message.reply(text: 'Hello, donne moi un @identifiant ou bien un #hashtag et je te dis ce qu\' en pense Twitter !')
  message.reply(text: application.controller.search_for("a string"))
end
