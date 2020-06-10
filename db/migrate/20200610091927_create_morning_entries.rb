class CreateMorningEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :morning_entries do |t|
      t.datetime :bed_time
      t.datetime :wake_up_time
      t.integer :ease_of_sleep
      t.integer :hours_of_sleep
      t.integer :morning_feeling
      t.timestamps
    end
  end
end
