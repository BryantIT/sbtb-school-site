class CreateKlasses < ActiveRecord::Migration[6.0]
  def change
    create_table :klasses do |t|
      t.string :name
      t.integer :grade
      t.belongs_to :teachers
      t.belongs_to :students
      t.timestamps
    end
  end
end
