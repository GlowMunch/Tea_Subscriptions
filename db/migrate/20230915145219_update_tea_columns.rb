class UpdateTeaColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :teas, :name
    add_column :teas, :title, :string
    remove_column :teas, :price
    add_column :teas, :description, :string
    add_column :teas, :brew_time, :integer
  end
end
