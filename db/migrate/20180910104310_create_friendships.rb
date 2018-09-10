class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.bigint :requester_id
      t.bigint :receiver_id
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_index :friendships, :requester_id
    add_index :friendships, :receiver_id
  end
end
