class DocumentsController < ApplicationController
  def create
    document = Document.find(params[:document_id])
    subdocument = Document.create(document_params.merge(
      parent_document: document,
      group: document.group,
    ))
    redirect_to [subdocument.group, subdocument]
  end

  def update
    topic = Topic.find(params[:topic_id])
    topic.document.update(document_params)
    redirect_to topic
  end

  def show
    @document = Document.find(params[:id])
    @group = Group.find(params[:group_id])
    if ! current_session.logged_in?(@group)
      redirect_to [:new, @group, :group_session]
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :body)
  end
end
