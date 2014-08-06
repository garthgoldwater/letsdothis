class MessagesController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    message = Message.create(message_params.merge(room_id: room.id))
    redirect_to room
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(handle: current_handle)
  end
end
