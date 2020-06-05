class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :student_id
      t.integer :parent_id
      t.integer :teacher_id
  

      t.timestamps
    end
    add_index :relationships, :student_id
    add_index :relationships, :parent_id
    add_index :relationships, :teacher_id
  end
end
