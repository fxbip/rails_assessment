class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :mentor, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings

  def full_name
    "#{self.first_name} #{self.last_name}"
      
  end
end
