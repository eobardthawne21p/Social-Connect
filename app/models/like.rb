class Like
  include Mongoid::Document
  include Mongoid::Timestamps

  # Associations
  belongs_to :user
  belongs_to :post

  # Validation to ensure that a user can only like a post once
  validates :user, uniqueness: { scope: :post, message: "can only like a post once" }
end
