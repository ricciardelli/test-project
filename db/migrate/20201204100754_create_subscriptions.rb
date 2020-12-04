class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :broadcast, null: false, foreign_key: true
      t.boolean :watched
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :registration_ip

      t.timestamps
    end
    add_index :subscriptions, :email, unique: true
  end
end
