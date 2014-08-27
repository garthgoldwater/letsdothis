class LandingsController < ApplicationController
  def show
    @group = Group.new
    @groups = Group.all
  end
end
