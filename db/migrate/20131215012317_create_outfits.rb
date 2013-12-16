class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.text :description
      t.integer :min_temp
      t.integer :max_temp
      t.text :url
      t.string :image

      t.timestamps
    end
  end
end
