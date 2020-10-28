module EventsHelper
  def are_attendee?
    if current_user.id == @event.creator_id
      @event.attendees.each.count.positive?
    end
  end

  def attending?
    
  end

  def user_creator?
    current_user.id == @event.creator_id
  end
end
