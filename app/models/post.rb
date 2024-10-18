class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :title, type: String
  field :description, type: String
  field :image, type: String
  field :location, type: String
  field :timeDate, type: Time
  field :likes, type: Integer, default: 0  # Track the number of likes

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :location, presence: true
  validates :timeDate, presence: true

  # Associations
  has_many :likes, dependent: :destroy  # Direct association with likes

  # Custom method to get the users who liked the post
  def liked_users
    User.where(:id.in => self.likes.pluck(:user_id))  # Query users based on the likes' user IDs
  end

  # Methods to increment and decrement likes
  def increment_likes!
    inc(likes: 1)
  end

  def decrement_likes!
    inc(likes: -1) if likes > 0  # Prevents decrementing below 0
  end
end
