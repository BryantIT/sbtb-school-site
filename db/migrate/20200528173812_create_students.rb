class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.integer :age
      t.integer :grade_level
      t.string :email
      t.text :about
      t.string :password_digest
      t.belongs_to :teacher
      t.string :role, default: 'student'

      t.timestamps
    end
  end
end
