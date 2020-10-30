module EventsHelper
  # rubocop: disable Style/GuardClause, Style/IfUnlessModifier
  def are_attendee?
    if current_user.id == @event.creator_id
      @event.attendees.each.count.positive?
    end
  end
  # rubocop: enable Style/GuardClause, Style/IfUnlessModifier

  # rubocop: disable Layout/LineLength
  def attending?
    if already_attended?
      link_to 'Dont Attend', attendance_path(event_id: @event.id), method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger p-1'
    else
      link_to 'Attend', attend_path(event_id: @event.id), class: 'btn btn-warning p-1'
    end
  end
  # rubocop: enable Layout/LineLength

  def user_creator?
    current_user.id == @event.creator_id
  end
end
