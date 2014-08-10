class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_session
    @room_session ||= RoomSession.new(session, Room.find(find_room_id))
  end

  def current_handle
    session[find_room_id]
  end

  def find_room_id
    room_id || find_topic_room_id
  end

  def find_topic_room_id
    find_topic.room_id
  end

  def find_topic
    Topic.find_by(id: params[:topic_id])
  end

  def room_id
    params[:room_id] || params[:id]
  end

  helper_method :current_session
  helper_method :current_handle
  helper_method :find_topic
end
