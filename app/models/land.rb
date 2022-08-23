class Land < ApplicationRecord
  belongs_to :user
  has_many :land_periodes
  validates :name, presence: true
end
