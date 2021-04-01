require 'rails_helper'

describe 'navigate' do
  it 'admin can be reached succesfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'does not allow users to access without being singed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end
end