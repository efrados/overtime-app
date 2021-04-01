class PostPolicy <  ApplicationPolicy
  def update?
    ((record.user_id == user.id) && !post_approved?) || admin?
  end

  private

  def admin?
    self.admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end
end