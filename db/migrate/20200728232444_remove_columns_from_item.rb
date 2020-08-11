class RemoveColumnsFromItem < ActiveRecord::Migration[6.0]
 
    change_table :items do |t|
      t.remove :market_price 
      t.remove :skin_name 
      t.remove :rarity 
      t.remove :stat_track 
    end
  
end
