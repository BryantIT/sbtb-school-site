class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.datetime :start
      t.datetime :end
      t.text :description
      t.integer :year
      t.timestamps
    end
  end
end
