class AddWantedPersonsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :wanted_persons, :integer
  end
end
