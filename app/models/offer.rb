class Offer < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :users, through: :matches
  belongs_to :owner, class_name: 'User'
  has_attachment :photo

  validates :city, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, inclusion: { in: 0..10000, message: "No more than 10000" }, presence: true, allow_blank: false
  validates :title, length: {minimum: 5, maximum: 20 }, presence: true, allow_blank: false


end

