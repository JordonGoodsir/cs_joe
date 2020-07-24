class ChangeWalletToBeFloatInProfile < ActiveRecord::Migration[6.0]
  def change 
    change_column :profiles, :wallet, :float
  end
end
