class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters do |t|
      t.string :title
      t.date :published
      t.text :body
      t.timestamps
    end
  end
end
