class Country < ActiveRecord::Base
  has_many :wines
  has_many :regions
  has_many :appellations
end
