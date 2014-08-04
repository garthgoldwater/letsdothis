class RoomsController < ApplicationController
  def create
    room = Room.create(room_params)
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    if !cookies.signed[@room.id]
      redirect_to [:new, @room, :room_session]
    end
  end

  private

  def room_params
    params.require(:room).permit(
      :name,
      :password,
      :password_confirmation,
    )
  end
end
