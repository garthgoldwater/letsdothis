class RoomSessionsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def create
    room = Room.find(params[:room_id])
    if logged_in?(room)
      redirect_to room
    else
      if room.authenticate(params[:password])
        log_in(params[:handle], room)
        redirect_to room
      else
        flash[:warning] = "Probably you got the password wrong"
        redirect_to [:new, room, :room_session]
      end
    end
  end

  def destroy
    room = Room.find(params[:room_id])
    leave(room)
    redirect_to root_path
  end

  private

  def logged_in?(room)
    session[room.id]
  end

  def leave(room)
    session[room.id] = nil
  end

  def log_in(handle, room)
    session[room.id] = handle
  end
end
