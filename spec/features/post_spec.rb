require 'rails_helper'

describe 'navigate' do
  let(:user) { create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of Posts' do
      post1 = build_stubbed(:post)
      post2 = build_stubbed(:second_post)
      visit posts_path

      expect(page).to have_content(/Rationale|Content/)
    end

    it 'has a scope so only user creator will se' do
      other_user = User.create(first_name: 'Non', last_name: 'Authorized', email: "nonauth@example.com", password: "asdfasdf", password_confirmation: "asdfasdf")
      post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id)
      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some Rationale'
      click_button 'Save'
      

      expect(page).to have_content('Some Rationale')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User association'
      click_button 'Save'

      expect(User.last.posts.last.rationale).to eq('User association')
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path
      click_on "new_post_from_nav"

      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = create(:user)
      login_as(delete_user, :scope => :user)
      post_to_delete = Post.create(date: Date.today, rationale: 'asdf', user_id: delete_user.id)
      visit posts_path
      click_on "destroy_#{post_to_delete.id}_from_index"

      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    before do
      visit edit_post_path(post)
    end

    it 'can be edited' do
      fill_in 'post[date]', with: Date.today + 1.day
      fill_in 'post[rationale]', with: 'Edited Rationale'
      click_button 'Save'

      expect(page).to have_content('Edited Rationale')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end