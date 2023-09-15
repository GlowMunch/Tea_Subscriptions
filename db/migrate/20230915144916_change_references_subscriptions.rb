class ChangeReferencesSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions, :customer, index: true, foreign_key: true
    add_column :subscriptions, :frequency, :integer
    add_column :subscriptions, :Title, :string
  end
end
