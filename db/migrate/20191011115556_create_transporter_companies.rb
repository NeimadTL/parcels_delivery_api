class CreateTransporterCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :transporter_companies do |t|
      t.string :name
      t.string :siret

      t.timestamps
    end
  end
end
