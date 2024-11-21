require "bcrypt"

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  field :name, type: String
  field :username, type: String
  field :password_digest, type: String
  field :birthday, type: Date
  field :role, type: String, default: "user"
  field :bio, type: String 
  field :profile_picture, type: String
  field :profile_picture_url, type: String
  field :links, type: Array, default: []

  ROLES = %w[user moderator admin]
  validates :role, inclusion: { in: ROLES }

  # Virtual attributes for password and confirmation
  attr_accessor :password, :password_confirmation

  # Validations
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validates :birthday, presence: true
  validates :role, presence: true
  validates :bio, length: { maximum: 300 }, allow_blank: true
  validates :profile_picture, format: { with: /\A(http|https):\/\/[^\s]+\z/, message: "must be a valid URL" }, allow_blank: true, unless: -> { profile_picture_url.present? }
  validates :profile_picture_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  validate :valid_links
  
  # Association that a user may have many posts
  has_many :posts

  # A user may have many comments
  has_many :chat_boards, dependent: :destroy

  # Validations for secure passwords
  validate :password_lower_case, if: :password_required?
  validate :password_uppercase, if: :password_required?
  validate :password_special_char, if: :password_required?
  validate :password_contains_number, if: :password_required?
  validate :password_length, if: :password_required?

  def password_uppercase
    return if password =~ /[A-Z]/
    errors.add :password, " must contain at least 1 uppercase character"
  end

  def password_lower_case
    return if password =~ /[a-z]/
    errors.add :password, " must contain at least 1 lowercase character"
  end

  def password_special_char
    special_characters = /[!@#$%^&*()_+{}\[\]:;"'`~<>,.?\/\\|-]/
    return if password =~ special_characters
    errors.add(:password, "must contain at least one special character")
  end

  def password_contains_number
    return if password =~ /[0-9]/
    errors.add :password, " must contain at least one number"
  end

  def password_length
    return if password.length >= 9
    errors.add :password, " must be at least 9 characters long"
  end

  # Method to set the password_digest (hash it before storing)
  def password=(new_password)
    @password = new_password # Store the raw password for confirmation
    self.password_digest = BCrypt::Password.create(new_password) unless new_password.blank?
  end

  # Method to authenticate the user (check if password_digest is correct)
  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end

   # Method to get the profile picture to display
   def display_profile_picture
    profile_picture_url.presence || profile_picture
  end

  # Method for roles
  def moderator?
    role == "moderator"
  end

  def admin?
    role == "admin"
  end
  # Associations
  has_many :likes, dependent: :destroy  # A user can have many likes
  has_many :goings, dependent: :destroy  # A user can have many goings

  # Custom method to get posts the user has liked
  def liked_posts
    Post.where(:id.in => self.likes.pluck(:post_id))
  end

  # Associations for saved posts
  has_many :saved_posts, dependent: :destroy

  # Helper method to get associated posts from saved_posts
  def saved_posts_associated
    Post.where(:id.in => saved_posts.pluck(:post_id))
  end

  # Custom method to get posts the user is going to
  def going_posts
    Post.where(:id.in => self.goings.pluck(:post_id))
  end


  private

  # Only require password on creation or if it's explicitly being changed
  def password_required?
    new_record? || password.present?
  end

  def valid_links
    return if links.blank?
  
    links.each do |link|
      unless link =~ URI::DEFAULT_PARSER.make_regexp(%w[http https])
        errors.add(:links, "#{link} is not a valid URL")
      end
    end
  end

end
