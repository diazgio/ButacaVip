module UsersHelper
  def user_logged?
    !current_user.nil?
  end
  
  def events?
    @event.each.count.positive?
  end

  def events_future?
    @future_event = current_user.attended_events.future_events
    @future_event.count.positive?
  end

  def events_past?
    @past_event = current_user.attended_events.past_events
    @past_event.count.positive?
  end
end
