class LandPeriodesController < ApplicationController
  def index
    @land_periodes = LandPeriodes.all
  end
end
