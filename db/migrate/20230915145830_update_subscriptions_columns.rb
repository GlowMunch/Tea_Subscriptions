class UpdateSubscriptionsColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :Title
    add_column :subscriptions, :title, :string
    remove_column :subscriptions, :cost
    add_column :subscriptions, :price, :integer
  end
end
