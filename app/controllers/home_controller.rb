class HomeController < ApplicationController
  def index
  	@news = News.first(5)
  	@events = Event.first(5)
  end
end
