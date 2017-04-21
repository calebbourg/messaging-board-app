require 'rails_helper'


RSpec.describe CommentsController, type: :controller do

  describe '#create' do
  
    it 'successfully creates a comment' do
      @user = create(:user, email: 'caleb@caleb.com', password: 'password')
      @post = create(:post, user_id: @user.id, title: 'title', body: 'body')
      sign_in @user
      expect do
        post :create, { post_id: @post.id,  comment: { body: 'body'} }
      end.to change { Comment.count }.by(1)
      expect(subject).to redirect_to post_path(@post)
    end

    describe '#destroy' do
      it 'successfully destroys a comment' do
        @user = create(:user, email: 'caleb@caleb.com', password: 'password')
        @post = create(:post, user_id: @user.id, title: 'title', body: 'body')
        @comment = create(:comment, post_id: @post.id, body: 'body', user_id: @user.id)
        expect do
          delete :destroy, post_id: @post.id, id: @comment.id
        end.to change { Comment.count }.by(-1)
        expect(subject).to redirect_to post_path(@post)
      end
    end  

  end

end