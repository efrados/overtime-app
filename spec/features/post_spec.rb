require 'rails_helper'

describe 'navigate' do
  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
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
  describe 'edit' do
    before do
      @post = create(:post)
    end
    it 'can be reached by clicking edit in the index page' do
      visit posts_path
      click_on "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end
    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today + 1.day
      fill_in 'post[rationale]', with: 'Edited Rationale'
      click_button 'Save'
      expect(page).to have_content('Edited Rationale')
    end
  end
end