class GroupSessionsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create
    group = Group.find(params[:group_id])
    if group.authenticate(params[:password])
      current_session.enter_group(group, params[:handle])
      redirect_to [group, group.document]
    else
      flash[:warning] = "You probably screwed up the password. you big ol' dummy"
      redirect_to [:new, group, :group_session]
    end
  end

  def destroy
    group = Group.find(params[:group_id])
    current_session.leave_group(group)
    redirect_to root_path
  end
end
