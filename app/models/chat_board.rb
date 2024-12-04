class ChatBoard
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :content, type: String
  field :post_id, type: BSON::ObjectId  # Ensure this matches the ID type of Post
  field :user_id, type: BSON::ObjectId  # Ensure this matches the ID type of User

  # Associations
  belongs_to :user  # Each comment is made by one user
  belongs_to :post  # Each comment belongs to one post

  # Validations
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
