class AddEventsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :event_id, :integer
  end
end
