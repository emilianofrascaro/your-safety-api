class ReservationExam < ApplicationRecord
  belongs_to :reservation
  belongs_to :exam
end
