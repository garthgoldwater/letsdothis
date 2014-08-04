class LandingsController < ApplicationController
  def show
    @room = Room.new
  end
end
