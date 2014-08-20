class AddTagLineColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tag_line, :string
  end
end
