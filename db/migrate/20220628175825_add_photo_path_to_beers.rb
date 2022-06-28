class AddPhotoPathToBeers < ActiveRecord::Migration[6.1]
  def change
    add_column :beers, :photo_path, :string
  end
end
