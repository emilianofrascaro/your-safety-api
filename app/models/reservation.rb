class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_exams
  has_many :exams, through: :reservation_exams

  validates :name, :date, :time, :address, presence: true
end
