class ChangeTypeColumnName < ActiveRecord::Migration
  def change
    rename_column(:consumed_wines, :type, :form)
  end
end
