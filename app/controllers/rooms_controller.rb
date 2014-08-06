class RoomsController < ApplicationController
  def create
    room = Room.create(room_params)
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.recent_last
    if ! current_session.logged_in?(@room)
      redirect_to [:new, @room, :room_session]
    end
  end


  def room_params
    params.require(:room).permit(
      :name,
      :password,
      :password_confirmation,
    )
  end
end
