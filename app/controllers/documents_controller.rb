class DocumentsController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    topic.create_document(document_params)
    redirect_to topic
  end

  def update
    topic = Topic.find(params[:topic_id])
    topic.document.update(document_params)
    redirect_to topic
  end

  private

  def document_params
    params.require(:document).permit(:body)
  end
end
