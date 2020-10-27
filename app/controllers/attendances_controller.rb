class AttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    if @event.save
      redirect_to user_path(current_user)
      flash[:alert] = 'Your are checked in to this Event'
    else
      flash[:alert] = 'Unable to send invite'
      redirect_to @event
    end
  end
end
