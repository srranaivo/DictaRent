class LandPeriode < ApplicationRecord
  belongs_to :land
  has_many :bookings

  def available?
    return !(bookings.where(status: 'accepted').exists?)
  end

  def already_rent_by_user?(curr_user_id)
    return bookings.where(user: curr_user_id).exists?
  end

end
