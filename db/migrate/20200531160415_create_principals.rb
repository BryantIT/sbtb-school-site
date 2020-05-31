class CreatePrincipals < ActiveRecord::Migration[6.0]
  def change
    create_table :principals do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :email
      t.text :about
      t.string :password_digest
      t.string :role, default: 'principal'
      t.timestamps
    end
  end
end
