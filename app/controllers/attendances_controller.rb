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

  def destroy
    @attendace = Attendance.where(event_id: params[:event_id], user_id: current_user.id).first
    @attendace.destroy
    respond_to do |format|
      format.html { redirect_to users_url, alert: 'Attendace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
