class AddUuidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :authkey, :uuid, default: 'uuid_generate_v4()'
  end
end
