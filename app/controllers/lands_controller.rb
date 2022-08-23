class LandsController < ApplicationController
  def index
    @lands = Land.where.not(user: nil)
  end

  def show
  end

  def new
    @land = Land.new
  end

  def select
    @lands = Land.where(user: nil)
  end

  def update
    @land
  end

  def create
    @land = Land.new(land_params)
    @land.user = current_user
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
