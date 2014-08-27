class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_session
    @group_session ||= GroupSession.new(session, Group.find(group_id))
  end

  def current_handle
    session[group_id]
  end

  def group_id
    params[:group_id] || find_document_group_id || params[:id]
  end

  def find_document_group_id
    document = Document.find_by(id: params[:document_id])
    document.group.id if document
  end

  def new_message
    Message.new
  end

  def new_document
    Document.new
  end

  helper_method :new_document
  helper_method :new_message
  helper_method :current_session
  helper_method :current_handle
end
