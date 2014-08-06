class RoomSession
  def initialize(session, room, handle)
    @session = session
    @room = room
    session[room.id] = handle
  end

  def enter(room, handle)
    @session[room.id] = handle
  end

  def leave(room)
    @session[room.id] = nil
  end

  def logged_in?(room)
    @session[room.id]
  end

  def allowed_to_visit?(room)
    @session[room.id]
  end
end
