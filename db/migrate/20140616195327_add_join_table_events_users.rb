class AddJoinTableEventsUsers < ActiveRecord::Migration
  def change
    create_join_table :events, :users
  end
end
