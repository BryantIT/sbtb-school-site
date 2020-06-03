class AddStatusToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :status, :string
    add_column :students, :status, :string
    add_column :principals, :status, :string
  end
end
