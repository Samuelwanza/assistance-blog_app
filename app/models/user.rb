class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, dependent: :destroy
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  attribute :name, :string # Add this line to include the 'name' attribute

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
