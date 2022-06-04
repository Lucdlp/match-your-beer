class AddColumnToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :user, foreign_key: true
    add_reference :favorites, :recipe, foreign_key: true
    add_reference :favorites, :beer, foreign_key: true
  end
end
