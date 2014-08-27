class MessagesController < ApplicationController
  def create
    document = Document.find(params[:document_id])
    message = Message.new(message_params.merge(document: document))
    message.save!
    redirect_to [message.group, message.document]
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(handle: current_handle)
  end
end
