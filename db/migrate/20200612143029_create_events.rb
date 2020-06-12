class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.text :body
      t.string :link

      t.timestamps
    end
  end
end
