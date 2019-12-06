class AddFrequencyToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :frequency, :integer, default: 0
  end
end
