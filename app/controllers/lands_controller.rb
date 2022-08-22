class LandsController < ApplicationController
  def index
    @lands = Land.all
  end
end
