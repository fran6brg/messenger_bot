class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.search_for(string)
    # return "this is a message"
    # message = ApplicationController.search_for("a string")
    # message.reply(text: message || "message")
  end
end
