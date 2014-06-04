class Wine < ActiveRecord::Base
  belongs_to :country
  belongs_to :region
  belongs_to :appellation
  has_one :price
  has_and_belongs_to_many :events
  has_and_belongs_to_many :grapes
  has_many :reviews
  has_and_belongs_to_many :users
  has_many :consumed_wines

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
  end
end
