class AddCreateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :create_id, :integer
  end
end