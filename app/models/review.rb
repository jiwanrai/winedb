class Review < ActiveRecord::Base
  belongs_to :wine
  has_and_belongs_to_many :events
end
