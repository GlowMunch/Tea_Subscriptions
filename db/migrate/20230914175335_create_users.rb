class Createcustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customername
      t.string :password

      t.timestamps
    end
  end
end
