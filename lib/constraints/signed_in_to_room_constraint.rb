class SignedInToRoomConstraint
  def initialize
    room_id = params[:id]
    @handle = coookies.signed[room_id]
  end

  def matches?
    @handle
  end
end
