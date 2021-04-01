class PostPolicy <  ApplicationPolicy
  def update?
    update.user_id == user.id || admin_types.include?(user.type)
  end
end