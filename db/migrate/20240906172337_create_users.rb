class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :confirmed
      t.datetime :confirmation_date
      t.boolean :locked
      t.boolean :password_expired

      t.timestamps
    end
  end
end
