class CreateReservationExams < ActiveRecord::Migration[7.1]
  def change
    create_table :reservation_exams do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
