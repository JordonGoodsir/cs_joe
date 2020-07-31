class AddWearToSkin < ActiveRecord::Migration[6.0]
  def change 
    add_column :skins, :wear, :string  
  end
end
