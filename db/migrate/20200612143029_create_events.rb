class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :start
      t.date :end
      t.boolean :allDay?
      t.string :resource?
      t.text :description
      t.timestamps
    end
  end
end
