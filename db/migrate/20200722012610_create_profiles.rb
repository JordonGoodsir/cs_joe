class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.string :picture
      t.integer :wallet

      t.timestamps
    end
  end
end
