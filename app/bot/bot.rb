require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV['ACCESS_TOKEN'])

Bot.on :message do |message|
  message.reply(text: 'Hello :), donne moi un @id ou bien un #hashtag et je te dis ce que la Twittosphère en pense.')
  if message.text.include? ("@" || "#")
    message.reply(text: 'Ok, je t\'envoie les résultats de mon analyse asap.')
    # client = TwitterHelper.get_client
    results = TwitterHelper.search_for(message.text)
    sum = 0
    if results.nil?
      message.reply(text: 'Aucun tweet ne match ta requête :/.')
    else
      results.each { |a| sum+=a }
      message.reply(text: "J'ai trouvé #{sum} tweets qui matchent ta requête ;).")
      categories = ["positifs", "neutres", "négatifs"]
      results.each_with_index do |result, index|
        message.reply(text: "Tweets #{categories[index]} : #{result} (#{(result/sum).round(2)}).")
      end
    end
  else
    message.reply(
      text: 'Ceci est une question ?',
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
