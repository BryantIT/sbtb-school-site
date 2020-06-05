class AddUserstoSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :user, index: true
  end
end
