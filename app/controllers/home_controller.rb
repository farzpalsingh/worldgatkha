class HomeController < ApplicationController
  def index
  	@news = News.first(5)
  	@events = Event.first(5)
    @attachments = Attachment.where(attachable_type: "Album").order("RANDOM()").limit(12)
    @attachment_count = @attachments.count.to_i
    @remaining_attachment = 12 - @attachment_count
  end

  def ageGroups
  end

  def tournaments
  end

  def grading
  end

  def trainingAndOath
  end

  def history
  end

  def advertiseWithUs
    
  end
end
