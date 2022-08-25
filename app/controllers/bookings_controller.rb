class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    p " "
    p params
    p " "
    @booking = Booking.new
    @booking.user = current_user
    @land_periode = LandPeriode.find(params[:land_periode_id])
    p @land_periode.inspect
    @booking.land_periode = @land_periode
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
