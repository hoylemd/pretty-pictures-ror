module UsersHelper
  def connected_to_500px?(user)
    user.oauth_token.blank? or user.oauth_secret.blank?
  end
end
