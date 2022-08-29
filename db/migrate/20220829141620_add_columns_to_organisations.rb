class AddColumnsToOrganisations < ActiveRecord::Migration[7.0]
  def change
    add_column :organisations, :name, :string
    add_column :organisations, :address, :string
    add_column :organisations, :description, :text
    add_column :organisations, :website, :string
    add_column :organisations, :email, :string
  end
end
