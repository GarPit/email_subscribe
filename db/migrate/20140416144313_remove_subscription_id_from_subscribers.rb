class RemoveSubscriptionIdFromSubscribers < ActiveRecord::Migration
  def change
    remove_column :subscribers, :subscription_id, :integer
  end
end
