class User < ActiveRecord::Base
  has_and_belongs_to_many :wines
  has_many :consumed_wines

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :password, length: { minimum: 6 }
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
