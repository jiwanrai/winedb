class Currency < ActiveRecord::Base
  has_many :prices
  has_many :consumed_wines
end
