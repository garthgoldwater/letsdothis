class RoomSession
  def initialize(session, room)
    @session = session
  end

  def enter_room(room, handle)
    @session[room.id] = handle
  end

  def leave_room(room)
    @session[room.id] = nil
  end

  def logged_in?(room)
    @session[room.id]
  end
end
