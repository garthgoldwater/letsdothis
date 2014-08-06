class RoomSessionsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def create
    room = Room.find(params[:room_id])
    if room.authenticate(params[:password])
      current_session.enter_room(room, params[:handle])
      redirect_to room
    else
      flash[:warning] = "You probably screwed up the password. you big ol' dummy"
      redirect_to [:new, room, :room_session]
    end
  end

  def destroy
    room = Room.find(params[:room_id])
    current_session.leave_room(room)
    redirect_to root_path
  end
end
