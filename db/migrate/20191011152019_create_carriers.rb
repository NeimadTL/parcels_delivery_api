class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.string :name
      t.integer :age
      t.boolean :has_driver_license_a
      t.boolean :has_driver_license_b
      t.boolean :has_driver_license_c

      t.timestamps
    end
  end
end
