class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :image, type: String
  field :location, type: String
  field :timeDate, type: Time
  field :likes, type: Integer

  # Add a reference to the User model
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :location, presence: true
  validates :timeDate, presence: true
end
