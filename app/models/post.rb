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
  field :goings, type: Integer, default: 0 # Track the user IDs of users who are going
  field :tags, type: Array, default: []

  # Add a reference to the User model
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :location, presence: true
  validates :timeDate, presence: true

  # Associations
  has_many :like, dependent: :destroy  # Direct association with likes
  has_many :saved_posts, dependent: :destroy
  has_many :goings, dependent: :destroy # Direct association with goings

  # Custom method to get the users who liked the post
  def liked_users
    User.where(:id.in => self.like.pluck(:user_id))  # Query users based on the likes' user IDs
  end

  # Methods to increment and decrement likes
  def increment_likes!
    self.inc(likes: 1)
  end

  def decrement_likes!
    self.inc(likes: -1)
  end

  # Methods to increment and decrement goings
  def increment_goings!
    self.inc(goings: 1)
  end

  def decrement_goings!
    self.inc(goings: -1)
  end
end
