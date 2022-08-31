class CreateNeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :needs do |t|
      t.string :name
      t.text :description
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
