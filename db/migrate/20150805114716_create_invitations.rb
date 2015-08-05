class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :status
      t.text :comment

      t.timestamps null: false
    end

    add_index :invitations, :user_id
    add_index :invitations, :event_id
    add_index :invitations, [:user_id, :event_id], unique: true
  end
end
