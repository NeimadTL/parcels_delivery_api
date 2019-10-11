class AddTransporterCompanyIdToCarriers < ActiveRecord::Migration[6.0]
  def change
    add_column :carriers, :transporter_company_id, :integer
  end
end
