class AddTaglistColumnToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :tag_list, :string
  end
end
