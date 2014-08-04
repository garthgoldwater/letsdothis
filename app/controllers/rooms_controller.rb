class RoomsController < ApplicationController
  def create
    room = Room.create(room_params)
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
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
