class GroupSession
  def initialize(session, group)
    @session = session
  end

  def enter_group(group, handle)
    if handle.present?
      @session[group.id] = handle
    end
  end

  def leave_group(group)
    @session[group.id] = nil
  end

  def logged_in?(group)
    @session[group.id]
  end
end
