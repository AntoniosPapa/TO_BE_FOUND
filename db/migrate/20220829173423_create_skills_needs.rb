class CreateSkillsNeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :skills_needs do |t|
      t.string :name
      t.text :description
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
