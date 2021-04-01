class PostPolicy <  ApplicationPolicy
  def update?
    record.user_id == user.id || self.admin_types.include?(user.type)
  end
end