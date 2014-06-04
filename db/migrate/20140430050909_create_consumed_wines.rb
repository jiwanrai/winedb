class CreateConsumedWines < ActiveRecord::Migration
  def change
    create_table :consumed_wines do |t|
      t.integer :user_id
      t.integer :wine_id
      t.integer :currency_id
      t.integer :price
      t.string :purchased_from
      t.date :date_consumed
      t.string :type
      t.string :review
      t.integer :rating

      t.timestamps
    end
  end
end
