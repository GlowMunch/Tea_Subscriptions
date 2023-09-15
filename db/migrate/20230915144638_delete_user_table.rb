class DeleteUserTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :subscriptions, :user, index: true, foreign_key: true
    drop_table :users
  end
end
