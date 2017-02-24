class Offer < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :users, through: :matches
  belongs_to :owner, class_name: 'User'
  has_attachment :photo
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :city, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, inclusion: { in: 0..10000, message: "No more than 10000" }, presence: true, allow_blank: false
  validates :title, length: {minimum: 3, maximum: 50 }, presence: true, allow_blank: false

end

