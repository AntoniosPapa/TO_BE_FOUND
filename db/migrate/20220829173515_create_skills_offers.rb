class CreateSkillsOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :skills_offers do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
