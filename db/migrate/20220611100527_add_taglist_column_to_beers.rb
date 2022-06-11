class AddTaglistColumnToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :tag_list, :string
  end
end
