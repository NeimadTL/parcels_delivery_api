class CreateGeolocations < ActiveRecord::Migration[6.0]
  def change
    create_table :geolocations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :altitude
      t.integer :carrier_id

      t.timestamps
    end
  end
end
