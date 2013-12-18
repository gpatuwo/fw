class AddUserIdToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :user_id, :integer
    add_index :outfits, :user_id
  end
end
