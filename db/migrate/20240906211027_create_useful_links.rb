class CreateUsefulLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :useful_links do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
