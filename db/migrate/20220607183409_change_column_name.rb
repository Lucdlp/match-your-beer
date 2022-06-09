class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :beers, :type, :color
  end
end
