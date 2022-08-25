class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.where(user: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @land_periode = LandPeriode.find(params[:land_periode_id])
    @booking.land_periode = @land_periode

    p '-------------------------------------------------'
    p @land_periode.already_rent_by_user?(current_user.id)
    p '-------------------------------------------------'

    return if !@land_periode.available? || @land_periode.already_rent_by_user?(current_user.id)

    if @booking.save
      redirect_to lands_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:land_periode, :user)
  end

end
