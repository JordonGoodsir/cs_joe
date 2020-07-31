class AddPartsToSkin < ActiveRecord::Migration[6.0]
  def change 
    add_column :skins, :icon_url, :text 
    add_column :skins, :average_price, :float 
    add_column :skins, :rarity, :string 
    add_column :skins, :rarity_color, :string  
  end 
end
