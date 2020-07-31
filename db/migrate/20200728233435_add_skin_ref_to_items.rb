class AddSkinRefToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :skin, foreign_key: true
  end
end
