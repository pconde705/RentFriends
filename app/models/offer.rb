class Offer < ApplicationRecord
    has_attachment :photo
    has_many :matches

  validates :city, presence: true, allow_blank: false
  validates :price, inclusion: { in: 0..10000, message: "No more than 10000" }, presence: true, allow_blank: false
  validates :description, length: {minimum: 5, maximum: 20 }, presence: true, allow_blank: false


end
