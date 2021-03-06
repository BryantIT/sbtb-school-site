class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.integer :grade_level
      t.string :email
      t.text :about
      t.string :password_digest
      t.string :status
    end
  end
end
