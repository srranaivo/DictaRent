class LandsController < ApplicationController
  def index
    @lands = Land.all
  end

  def show
  end

  def new
  end

  def create
  end
end
