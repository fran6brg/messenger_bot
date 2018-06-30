require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  if message.text.nil?
    message.reply(text: 'Hello, donne moi un @identifiant ou bien un #hashtag et je te dis ce qu\' en pense Twitter :).')
  elsif message.text.include ("@" || "#")
    message.reply(text: 'Ok, je t\'envoie les résultats de mon analyse de "#{message.text}" asap.')
  else
    message.reply(
      text: 'Human, who is your favorite bot?',
      quick_replies: [
        {
          content_type: 'text',
          title: 'You are!',
          payload: 'HARMLESS'
        }
      ]
    )
  end
end
