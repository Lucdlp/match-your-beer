class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :name
      t.string :type
      t.string :country
      t.text :description
      t.string :style
      t.string :photo
      t.float :alcohol_level
      t.integer :ibu_level

      t.timestamps
    end
  end
end
