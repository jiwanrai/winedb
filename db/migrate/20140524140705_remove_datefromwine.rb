class RemoveDatefromwine < ActiveRecord::Migration
  def change
    remove_column :wines, :purchased_from
    remove_column :wines, :date_consumed
  end
end
