class CreateCountersUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :counters, :users
  end
end
