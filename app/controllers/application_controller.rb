class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_session
    RoomSession.new(session, Room.find(room_id))
  end

  def current_handle
      session[room_id]
  end

  def room_id
    params[:room_id] || params[:id]
  end

  helper_method :current_session
  helper_method :current_handle
end
