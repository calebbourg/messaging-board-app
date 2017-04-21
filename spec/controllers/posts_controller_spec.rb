require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe '#index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'assigns proper variables' do
      @user1 = create(:user, email: 'caleb@caleb.com', password: 'bourg1234')
      @post1 = create(:post, user_id: @user1.id, title: 'title', body: 'body')
      @post2 = create(:post, user_id: @user1.id, title: 'title', body: 'body')
      get :index
      expect(assigns(:posts).count).to eq(2)
    end
  end

  describe '#create' do
    it 'successfully creates a post' do
      @user = create(:user, email: 'caleb@caleb.com', password: 'password')
      sign_in @user
      expect do
        post :create, { post: { body: 'body', title: 'title '} }
      end.to change { Post.count }.by(1)
      expect(subject).to redirect_to root_path
    end
  end

  describe '#show' do
    
    before do
      @user = create(:user, email: 'caleb@caleb.com', password: 'password')
      @post = create(:post, title: 'title', body: 'body', user_id: @user.id)
      @comment = create(:comment, body: 'body', user_id: @user.id, post_id: @post.id)
      @comment2 = create(:comment, body: 'body', user_id: @user.id, post_id: @post.id)
    end
    it "responds successfully with an HTTP 200 status code" do
      get :show, { id: @post.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :show, { id: @post.id }
      expect(response).to render_template("show")
    end

    it 'assigns proper variables' do
      get :show, { id: @post.id }
      expect(assigns(:post)).to eq(@post)
      expect(assigns(:comments)).to include(@comment, @comment2)
    end  
  end
end