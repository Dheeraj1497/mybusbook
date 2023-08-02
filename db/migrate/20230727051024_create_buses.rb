class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :number
      t.integer :total_seats

      t.timestamps
    end
  end
end
