class CreateSkillOffereds < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_offereds do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
