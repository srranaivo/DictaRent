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
    @booking = Booking.new
    @booking.user = current_user
    @land_periode = LandPeriode.find(params[:land_periode_id])
    p @land_periode.inspect
    @booking.land_periode = @land_periode
    if @booking.save
      flash[:success] = "Your request has been into concern."
    else
      flash[:alert] = "Something went wrong, try again."
    end
    redirect_to land_path(@land_periode.land)
  end
  # <%= if @land_periode.booked_by_owner?%>

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:land_periode, :user)
  end

end
