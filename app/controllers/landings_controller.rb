class LandingsController < ApplicationController
  def show
    @room = Room.new
    @rooms = Room.all
  end
end
