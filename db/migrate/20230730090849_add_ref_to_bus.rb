class AddRefToBus < ActiveRecord::Migration[7.0]
  def change
    add_reference :buses, :bus_route, foreign_key:true
  end
end
