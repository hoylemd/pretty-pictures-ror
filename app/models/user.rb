class User < ActiveRecord::Base
  string_field_length = {maximum: 63}

  before_save { self.username = username.downcase }

  validates :username, presence: true, length: string_field_length, uniqueness: true
  validates :token, length: string_field_length
  validates :secret, length: string_field_length
  validates :bio, length: {maximum: 255}
  validates :password, length: { minimum: 6 }

  has_secure_password

  def connected_to_500px?
    !(self.oauth_token.blank? or self.oauth_secret.blank?)
  end
end
