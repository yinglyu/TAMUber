class AddOccupancyToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :occupancy, :string
  end
end
