class User < ActiveRecord::Base
  string_field_length = {maximum: 63}
  validates :username, presence: true, length: string_field_length, uniqueness: true
  validates :token, length: string_field_length
  validates :secret, length: string_field_length
  validates :bio, length: {maximum: 255}
end
