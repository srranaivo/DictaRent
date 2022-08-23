class Land < ApplicationRecord
  belongs_to :user, optional: true
  has_many :land_periodes
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  # validates :description, presence: true
end
