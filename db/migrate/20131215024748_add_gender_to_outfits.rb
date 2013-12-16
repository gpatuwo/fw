class AddGenderToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :gender, :string
  end
end
