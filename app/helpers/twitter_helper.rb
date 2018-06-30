module TwitterHelper
  def self.get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN_TW']
      config.access_token_secret = ENV['TOKEN_SECRET_TW']
    end
  end

  def get_client
    TwitterHelper.client
  end

  def self.search_for(string)
    # get client
    client = TwitterHelper.get_client
    puts (client.access_token == nil ? "client is nil" : "client is ok, let fire the API !")
    # get analyser + initialize some vars
    analyzer = Sentimental.new
    analyzer.load_defaults
    analyzer.threshold = 0.1
    score = 0
    positive = 0
    neutral = 0
    negative = 0
    # scrap tweets
    client.search(string, result_type: "recent").first(100).collect do |tweet|
      # "#{tweet.user.screen_name}: #{tweet.text}"
      score = analyzer.score tweet.text
      if score > 0.25
        positive += 1
      elsif score > -0.25
        neutral += 1
      else
        negative += 1
      end
    end
    results = [positive, neutral, negative]
    return results
  end
end

