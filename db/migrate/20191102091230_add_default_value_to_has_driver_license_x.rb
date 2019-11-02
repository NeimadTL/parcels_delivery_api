class AddDefaultValueToHasDriverLicenseX < ActiveRecord::Migration[6.0]
  def change
     change_column :carriers, :has_driver_license_a, :boolean, default: false
     change_column :carriers, :has_driver_license_b, :boolean, default: false
     change_column :carriers, :has_driver_license_c, :boolean, default: false
  end
end
