class User < ApplicationRecord
  has_many :offers, through: :matches
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, allow_blank: false
  validates :age, inclusion: { in: 18..99, message: "Please choose an age between 18 - 99" }, presence: true, allow_blank: false
  validates :gender, inclusion: { in: %w( male female ), message: "Please specify either 'male' or 'female'" }, presence: true, allow_blank: false

end
