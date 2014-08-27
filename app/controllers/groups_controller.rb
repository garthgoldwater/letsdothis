class GroupsController < ApplicationController
  def create
    group = Group.create(group_params)
    document = Document.create(title: group.name, group_id: group.id)
    group.update(document_id: document.id)
    redirect_to [group, group.document]
  end

  def show
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      :password,
      :password_confirmation,
    )
  end
end
