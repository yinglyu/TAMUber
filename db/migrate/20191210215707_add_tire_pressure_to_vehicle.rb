class AddTirePressureToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :tire_pressure, :string
  end
end
