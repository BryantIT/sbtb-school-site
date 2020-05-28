class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :email
      t.text :about
      t.string :password_digest
      t.belongs_to :student
      t.string :role, default: 'parent'

      t.timestamps
    end
  end
end
