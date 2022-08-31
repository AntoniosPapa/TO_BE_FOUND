class AddDescriptionToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :description, :text
  end
end
