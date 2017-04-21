class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :body, :post_id, :user_id, presence: true
end