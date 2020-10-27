module EventsHelper
  def are_attendees?
    if current_user.id == @event.creator_id
      countee = @event.attendees.each.count.positive?
      content_tag :p, countee, :class => 'btn btn-warning p-3'
    end
  end

  def creator?
    current_user.id == @event.creator_id
  end
end
