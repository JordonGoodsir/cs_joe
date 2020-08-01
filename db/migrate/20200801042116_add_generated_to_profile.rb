class AddGeneratedToProfile < ActiveRecord::Migration[6.0]
  def change 
    add_column :profiles, :generated, :boolean
  end
end
