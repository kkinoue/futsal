class RenameDatetimeToStarttime < ActiveRecord::Migration
  def change
    # [形式] rename_column(テーブル名, 変更前のカラム名, 変更後のカラム名)
    rename_column :events, :datetime, :starttime
  end
end
