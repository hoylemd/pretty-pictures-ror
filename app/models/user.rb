class User < ActiveRecord::Base
  string_field_length = {maximum: 63}

  before_save { self.username = username.downcase }

  validates :username, presence: true, length: string_field_length, uniqueness: true
  validates :token, length: string_field_length
  validates :secret, length: string_field_length
  validates :bio, length: {maximum: 255}
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
