class AddPartsTo < ActiveRecord::Migration[6.0]
  def change 
    add_column :skins, :weapon_type, :string  
    add_column :skins, :gun_type, :string  
    add_column :skins, :stat_track, :string  
  end
end
