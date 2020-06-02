class CreateKlass < ActiveRecord::Migration[6.0]
  def change
    create_table :klasses do |t|
      t.string :title
      t.integer :year
      t.belongs_to :teacher
      t.belongs_to :student
    end
  end
end
