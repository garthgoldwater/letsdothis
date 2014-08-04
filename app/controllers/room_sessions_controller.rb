class RoomSessionsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def create
    room = Room.find(params[:room_id])
    if room.authenticate(params[:password])
      cookies.signed[room.id] = params[:handle]
      redirect_to room
    else
      flash[:warning] = "Couldn't sign into room"
      redirect_to [:new, room, :room_session]
    end
  end

  def destroy
    leave_room
    redirect_to root_path
  end

  private

  def leave_room
    cookies.signed[room.id] = nil
  end
end
