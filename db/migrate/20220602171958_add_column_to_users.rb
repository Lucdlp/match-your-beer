class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :age, :integer
    add_column :users, :user_country, :string
    add_column :users, :user_address, :string
    add_column :users, :gender, :string
  end
end
