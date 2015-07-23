class AddEndtimeToEvents < ActiveRecord::Migration
  def change
    # [形式] add_column(テーブル名, カラム名, データ型)
    add_column :events, :endtime, :datetime
  end
end
