class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :start
      t.date :end
      t.string :eventClasses
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
