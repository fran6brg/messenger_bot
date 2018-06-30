class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.search_for(string)
    return "this is a message"
  end
end
