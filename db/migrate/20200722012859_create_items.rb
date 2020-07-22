class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :skin_name
      t.integer :market_price
      t.references :profile, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true
      t.string :rarity
      t.boolean :stat_track

      t.timestamps
    end
  end
end
