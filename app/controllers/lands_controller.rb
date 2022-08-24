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
    @land = Land
    @lands = Land.where(user: nil)
  end

  def attach_owner
    @land = Land.find(params[:Land]['user_id'])
    p @land
    @land.update(user: current_user)
  end

  def create
    p ' '
    p 'create method'
    p ' '
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
