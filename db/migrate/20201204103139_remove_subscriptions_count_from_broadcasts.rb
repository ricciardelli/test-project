class RemoveSubscriptionsCountFromBroadcasts < ActiveRecord::Migration[6.0]
  def change
  	remove_column :broadcasts, :subscription_count, :integer
  end
end
