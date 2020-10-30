module UsersHelper
  def user_logged?
    !current_user.nil?
  end

  # rubocop: disable Style/RedundantInterpolation, Style/LineEndConcatenation, Layout/LineLength, Style/GuardClause
  def same_user?
    if current_user.id == @user.id
      ("#{link_to 'Edit', edit_user_path(@user), class: 'text-light px-2'}" <<
        "#{link_to 'Destroy', @user, method: :delete, data: { confirm: 'Are you sure?' }, class: 'text-light px-2'}").html_safe
    end
  end
  # rubocop: enable Style/RedundantInterpolation, Style/LineEndConcatenation, Layout/LineLength, Style/GuardClause

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
