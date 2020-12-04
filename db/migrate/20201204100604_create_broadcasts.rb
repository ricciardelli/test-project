class CreateBroadcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :broadcasts do |t|
      t.string :title
      t.date :broadcast_date
      t.integer :subscriptions_count, default: 0

      t.timestamps
    end
  end
end
