class Price < ActiveRecord::Base
  validates :amount, presence: true
  validates :wine_id, uniqueness: true
  belongs_to :wine
  belongs_to :currency
end
