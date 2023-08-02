class CreateBusRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_routes do |t|
      t.string :from
      t.string :to
      t.datetime :departure_time
      t.datetime :arrival_time
      t.references :bus, null: false, foreign_key: true
      t.integer :available_seats

      t.timestamps
    end
  end
end
