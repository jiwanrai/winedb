class AddTimestampToWines < ActiveRecord::Migration
  def change
      add_column(:wines, :created_at, :datetime)
      add_column(:wines, :updated_at, :datetime)
  end
end
