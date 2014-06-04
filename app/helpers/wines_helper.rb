module WinesHelper

  def get_wine_price(wine)
    wine.price ? number_to_currency(wine.price.amount, unit: wine.price.currency.symbol) : "Unspecified"
  end

end
