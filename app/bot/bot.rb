require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])


Bot.on :message do |message|
  message.reply(text: 'Hello, donne moi un @identifiant ou bien un #hashtag et je te dis ce qu\' en pense Twitter :).')
  if message.text.include? ("@" || "#")
    message.reply(text: 'Ok, je t\'envoie les résultats de mon analyse asap.')
    client = TwitterHelper.get_client
    results = client.search_for(message.text)
    results.each do |result|
      message.reply(text: "Positif : #{result}")
    end
  else
    message.reply(
      text: 'Ceci est une question',
      quick_replies: [
        {
          content_type: 'text',
          title: 'Ceci est une réponse',
          payload: 'HARMLESS'
        },
        {
          content_type: 'text',
          title: 'Ceci est une réponse identique',
          payload: 'EXTERMINATE'
        }
      ]
    )
  end
end
