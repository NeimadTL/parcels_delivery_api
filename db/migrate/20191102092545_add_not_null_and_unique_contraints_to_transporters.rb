class AddNotNullAndUniqueContraintsToTransporters < ActiveRecord::Migration[6.0]
  def change
    change_column :transporter_companies, :name, :string, null: false
    change_column :transporter_companies, :siret, :string, null: false
    add_index :transporter_companies, :siret, unique: true
  end
end
