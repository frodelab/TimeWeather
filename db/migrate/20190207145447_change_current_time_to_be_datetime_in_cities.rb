class ChangeCurrentTimeToBeDatetimeInCities < ActiveRecord::Migration[5.0]
  def change
    change_column :cities, :current_time, :datetime
  end
end
