class AddEnrolledToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :enrolled, :date
    add_column :students, :enrolled, :date
  end
end
