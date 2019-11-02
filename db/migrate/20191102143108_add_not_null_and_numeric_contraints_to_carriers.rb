class AddNotNullAndNumericContraintsToCarriers < ActiveRecord::Migration[6.0]
  def change
    change_column :carriers, :name, :string, null: false
    change_column :carriers, :age, :string, null: false

    # reversible do |dir|
    #   dir.up do
    #     # add a CHECK constraint on age
    #     execute <<-SQL
    #       ALTER TABLE carriers
    #         ADD CONSTRAINT agechk
    #           CHECK (age >= 18) NO INHERIT
    #     SQL
    #   end
    #   dir.down do
    #     execute <<-SQL
    #       ALTER TABLE carriers
    #         DROP CONSTRAINT agechk
    #     SQL
    #   end
    # end
  end
end
