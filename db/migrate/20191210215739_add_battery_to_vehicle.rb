class AddBatteryToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :battery, :string
  end
end
