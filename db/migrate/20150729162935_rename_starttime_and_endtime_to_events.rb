class RenameStarttimeAndEndtimeToEvents < ActiveRecord::Migration
  def change
    rename_column :events, :starttime, :start_time
    rename_column :events, :endtime, :end_time
  end
end
