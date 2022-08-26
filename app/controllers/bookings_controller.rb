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

    puts @land_periode.inspect
    @land_periode.update(read: false)
    puts @land_periode.inspect

    @booking.land_periode = @land_periode

    return if !@land_periode.available? || @land_periode.already_rent_by_user?(current_user.id)

    if @booking.save
      flash[:success] = "Your request has been into concern."
    else
      flash[:alert] = "Something went wrong, try again."
    end
    redirect_to land_path(@land_periode.land)
  end
  # <%= if @land_periode.booked_by_owner?%>

  def update
    p 'update booking'
    p params[:status]
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])
    redirect_to land_path(current_user.land.id)
  end

  def accepted_booking?

  end

  private

  def booking_params
    params.require(:booking).permit(:land_periode, :user)
  end

end
