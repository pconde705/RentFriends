class Match < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :user, presence: true, uniqueness: { scope: :offer }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
