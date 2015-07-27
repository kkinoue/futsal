class AddConstraintsToEvents < ActiveRecord::Migration
  def change
    change_column :events, :title,     :string,   null: false
    change_column :events, :starttime, :datetime, null: false
    change_column :events, :endtime,   :datetime, null: false
  end
end
