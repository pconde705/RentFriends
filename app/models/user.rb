class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :matches
  has_many :offers
  has_many :offers, through: :matches

  validates :first_name, presence: true, allow_blank: false
  validates :age, inclusion: { in: 18..100, message: "You must be at least 18 - 100" }, presence: true, allow_blank: false
  validates :gender, inclusion: { in: %w( male female ), message: "Choose either 'male' or 'female'" }, presence: true, allow_blank: false

end
