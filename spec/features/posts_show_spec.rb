require 'rails_helper'


feature 'posts#show' do 
  before do 
	@user = create(:user, email: 'caleb@caleb.com', password: 'password')
	@post = create(:post, title: 'title', body: 'body', user_id: @user.id)
  end

  describe 'leave a comment' do
    scenario 'user is not signed in' do
      visit post_path(@post)
      expect(page.find('#comment-button')[:class].include?('.disabled'))
    end

    scenario 'user is signed in' do
      login_as(@user, :scope => :user)
      visit post_path(@post)
      expect(!page.find('#dLabel')[:class].include?('.disabled'))
      page.find('#dLabel').click
      expect(page).to have_content('Body')
    end 
  end
end
