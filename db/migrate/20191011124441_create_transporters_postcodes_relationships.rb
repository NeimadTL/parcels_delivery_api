class CreateTransportersPostcodesRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :transporters_postcodes_relationships do |t|
      t.integer :transporter_company_id
      t.integer :post_code_id

      t.timestamps
    end
    add_index :transporters_postcodes_relationships, [:transporter_company_id, :post_code_id], unique: true, name: :transporters_postcodes_index
  end
end
