class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :short_name
      t.string :latitude
      t.string :longitude
      t.date :current_time
      t.float :current_weather

      t.timestamps
    end
  end
end
