class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :land_periode
  enum :status, { pending: 0, accepted: 1, rejected: 2, canceled: 3 }
end
