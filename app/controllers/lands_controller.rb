class LandsController < ApplicationController
  def index
    @lands = Land.all
  end

  def show
  end

  def new
    @land = Land.new
  end

  def create
    @land = Land.new(land_params)
    if @land.save
      redirect_to lands_path
    else
      render :new, status: :unprocessable_entity
    end
  end

private

def land_params
  params.require(:land).permit(:name, :description)
end


end
