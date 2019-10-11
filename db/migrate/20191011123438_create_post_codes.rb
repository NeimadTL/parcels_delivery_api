class CreatePostCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
