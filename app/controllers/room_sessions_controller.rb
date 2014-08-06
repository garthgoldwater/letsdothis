class RoomSessionsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def create
    room = Room.find(params[:room_id])
    if room.authenticate(params[:password])
      @room_session = RoomSession.new(session, room, params[:handle])
      redirect_to room
    else
      flash[:warning] = "Probably you got the password wrong"
      redirect_to [:new, room, :room_session]
    end
  end

  def destroy
    room = Room.find(params[:room_id])
    room_session = RoomSession.new(session, room, params[:handle])
    room_session.leave(room)
    redirect_to root_path
  end
end
