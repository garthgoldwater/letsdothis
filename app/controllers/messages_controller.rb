class MessagesController < ApplicationController
  def create
    message_parent = find_parent
    message = Message.create(message_params.merge(message_parent: message_parent, room: message_parent.room))
    redirect_to [message_parent.parent, message_parent]
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(handle: current_handle)
  end

  def find_parent
    find_room || find_topic
  end

  def find_room
    Room.find_by(id: params[:room_id])
  end
end
