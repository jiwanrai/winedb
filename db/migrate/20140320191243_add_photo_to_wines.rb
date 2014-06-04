class AddPhotoToWines < ActiveRecord::Migration
  def change
    add_attachment :wines, :picture
  end
end
