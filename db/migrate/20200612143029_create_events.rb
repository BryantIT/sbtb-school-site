class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.text :body
      t.string :link
      t.belongs_to :user
      t.timestamps
    end
  end
end
