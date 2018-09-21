class HomeController < ApplicationController
  def index
  	@news = News.first(5)
  	@events = Event.first(5)
  end

  def ageGroups
  end

  def tournaments
  end

  def history
  end

  def advertiseWithUs
    
  end
end
