class LandPeriodesController < ApplicationController
  def index
    @land_periodes = LandPeriode.all
  end

  def show
  end


  def new
    @land = Land.find(params[:land_id])
    @land_periodes = LandPeriode.new
  end

  def create
    puts "create methode"
    @land_periodes = LandPeriode.new(land_periodes_params)
    @land_periodes.land = current_user.land

    if @land_periodes.save
      redirect_to land_periodes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def land_periodes_params
    params.require(:land_periode).permit(:starts_the, :ends_the, :land_id)
  end

end
