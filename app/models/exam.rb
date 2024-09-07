class Exam < ApplicationRecord
  has_many :reservation_exams
  has_many :reservations, through: :reservation_exams

  validates :name, presence: true, uniqueness: true
end
