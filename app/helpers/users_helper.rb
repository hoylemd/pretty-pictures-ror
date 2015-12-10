module UsersHelper
  def connected_to_500px(user)
    (user.token.blank? or @user.secret.blank) ? 'No' : 'Yes'
  end
end
