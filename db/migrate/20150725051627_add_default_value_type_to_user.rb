class AddDefaultValueTypeToUser < ActiveRecord::Migration
  def up
    change_column_default :users, :type, 'general'
  end

  def down
    change_column_default :users, :type, nil
  end
end
