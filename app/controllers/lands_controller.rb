class LandsController < ApplicationController
  def index
    @lands = Land.where.not(user: nil, user: current_user)
  end

  def show
    @land = Land.find(params[:id])
    @periodes = @land.land_periodes
    @status = current_user.land == @land

    return unless @land == current_user.land
    @periodes.each do |periode|
      periode.update(read: true)
    end

  end

  def new
    @land = Land.new
  end

  def select
    @land = Land
    @lands = Land.where(user: nil).order('name ASC')
  end

  def attach_owner
    @land = Land.find(params[:Land]['land_id'])
    @land.update(user: current_user)
    redirect_to land_path(@land)
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
