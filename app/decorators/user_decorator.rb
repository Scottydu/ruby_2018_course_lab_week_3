class UserDecorator < SimpleDelegator
  def show_add_friend_button?(current_user)
    return false if current_user.nil?
    !is_user_current_user?(current_user) && !is_current_user_already_a_friend_of_user?(current_user)
  end

  private

  def is_user_current_user?(current_user)
    current_user == @delegate_sd_obj
  end

  def is_current_user_already_a_friend_of_user?(current_user)
    @delegate_sd_obj.friends.include?(current_user)
  end
end
