class AddRemoveReferenceFromItem < ActiveRecord::Migration[6.0]
  def change 
    remove_column :items, :listing_id
    add_reference :items, :listing, null: true, foreign_key: true

  end
end
