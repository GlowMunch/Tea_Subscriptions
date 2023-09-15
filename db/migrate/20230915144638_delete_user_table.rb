class DeletecustomerTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :subscriptions, :customer, index: true, foreign_key: true
    drop_table :customers
  end
end
