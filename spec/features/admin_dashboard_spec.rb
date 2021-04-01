require 'rails_helper'

describe 'navigate' do
  it 'can be reached succesfully by an admin' do
    admin_user = create(:admin_user)
    login_as(admin_user, :scope => :user)
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'does not allow users to access without being singed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'can not been reach by non admin users' do
    user = create(:user)
    login_as(user, :scope => :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end
end