require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  message.reply(text: 'Hello, donne moi un @identifiant ou bien un #hashtag et je te dis ce qu en pense Twitter !')
end
