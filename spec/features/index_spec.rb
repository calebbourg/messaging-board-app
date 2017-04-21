require 'rails_helper'


feature 'index' do
	before do 
	  @user = create(:user, email: 'caleb@caleb.com', password: 'password')
	  @post = create(:post, title: 'title', body: 'body', user_id: @user.id)
	end

  describe 'add new post' do
    scenario 'user is not signed in' do
      visit '/'
      expect(page.find('#add-post')[:class].include?('.disabled'))
    end

    scenario 'user is signed in' do
      login_as(@user, :scope => :user)
      visit '/'
      expect(!page.find('#add-post')[:class].include?('.disabled'))
      page.find('#add-post').click
      expect(page).to have_content('Create a Post')
    end
  end

  describe 'add new comment' do
    scenario 'user is not signed in' do
      visit '/'
      expect(page.find('#comment-button')[:class].include?('.disabled'))
    end

    scenario 'user is signed in' do
      login_as(@user, :scope => :user)
      visit '/'
      expect(!page.find('#dLabel')[:class].include?('.disabled'))
      page.find('#dLabel').click
      expect(page).to have_content('Body')
    end

  end


end