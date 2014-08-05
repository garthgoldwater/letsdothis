class RoomsController < ApplicationController
  def create
    room = Room.create(room_params)
    redirect_to room
  end

  def show
    @room = Room.find(params[:id])
    if ! allowed_to_visit?(@room)
      redirect_to [:new, @room, :room_session]
    end
  end

  private

  def current_handle
    @current_handle = session[@room.id]
  end

  helper_method :current_handle

  def allowed_to_visit?(room)
    session[room.id]
  end

  def room_params
    params.require(:room).permit(
      :name,
      :password,
      :password_confirmation,
    )
  end
end
