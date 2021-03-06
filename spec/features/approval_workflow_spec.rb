require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @post = create(:post)
      visit edit_post_path(@post)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose 'post_status_approved'

      click_button 'Save'

      expect(@post.reload.status).to eq('approved')
    end

    it 'can not be edited by a non admin' do
      logout(:user)
      user = create(:user)
      login_as(user, :scope => :user)

      visit edit_post_path(@post)

      expect(current_path).to_not have_content('Approved')

    end

    it 'can not be editable by the post creator after approved' do
      logout(:user)
      user = create(:user)
      login_as(user, :scope => :user)

      @post.update(user: user, status: 'approved')

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end