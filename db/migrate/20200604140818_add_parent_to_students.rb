class AddParentToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :parent, index: true
  end
end
