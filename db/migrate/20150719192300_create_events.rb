class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :datetime
      t.string :place
      t.string :memo

      t.timestamps null: false
    end
  end
end
