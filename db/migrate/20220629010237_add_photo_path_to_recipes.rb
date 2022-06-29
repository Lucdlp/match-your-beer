class AddPhotoPathToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :photo_path, :string
  end
end
