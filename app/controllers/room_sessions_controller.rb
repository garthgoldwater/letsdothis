class RoomSessionsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
  end

  def create
    room = Room.find(params[:room_id])
    if room && room.authenticate(params[:password])
      cookies.signed[room.id] = params[:handle]
      redirect_to room
    else
      flash.now[:warning] = "Couldn't sign into room"
      redirect_to root_path
    end
  end

  def destroy
    cookies.signed[room.id] = nil
    redirect_to root_path
  end

  private

  # def room_session_params
  #   params.require(:room_session).permit(
  #     :password,
  #     :handle,
  #     :room_id,
  #     )
  # end
end
