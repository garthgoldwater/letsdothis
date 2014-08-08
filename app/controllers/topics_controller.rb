class TopicsController < ApplicationController
  def create
    topic_parent = find_parent
    topic = Topic.create(topic_params.merge(topic_parent: topic_parent, room: topic_parent.room))
    redirect_to topic
  end

  def show
    @topic = Topic.find(params[:id])
    @room = @topic.room
  end

  private

  def topic_params
    params.require(:topic).permit(
      :title,
    )
  end

  def find_parent
    find_topic || find_room
  end

  def find_topic
    Topic.find_by(id: params[:topic_id])
  end

  def find_room
    Room.find(params[:room_id])
  end
end
