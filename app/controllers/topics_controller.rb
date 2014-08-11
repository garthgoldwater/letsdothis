class TopicsController < ApplicationController
  def create
    topic_parent = find_parent
    parent_params = { topic_parent: topic_parent, room: topic_parent.room }
    topic = Topic.create(topic_params.merge(parent_params))
    redirect_to [topic.topic_parent, topic]
  end

  def show
    @topic = Topic.find(params[:id])
    @subtopic = Topic.new
    @room = @topic.room
    @message = Message.new
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

  def find_room
    Room.find(params[:room_id])
  end
end
