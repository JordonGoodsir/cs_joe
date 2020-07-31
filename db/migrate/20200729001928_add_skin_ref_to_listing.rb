class AddSkinRefToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :skin, null: false, foreign_key: true
  end
end
