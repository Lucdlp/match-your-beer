class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :aliment_type
      t.string :photo
      t.integer :prep_time
      t.string :difficulty_level

      t.timestamps
    end
  end
end
