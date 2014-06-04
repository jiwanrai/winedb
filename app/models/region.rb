class Region < ActiveRecord::Base
  has_many :wines
  belongs_to :country
end
