class ChangeAmountFormatInPrices < ActiveRecord::Migration
  def change
    change_column :prices, :amount, :decimal, :precision => 8, :scale => 2
  end
end
