class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :selling_price
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
