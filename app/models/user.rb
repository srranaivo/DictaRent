class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :land
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def dictator?
    return current_user.land ? true : false
  end
end
