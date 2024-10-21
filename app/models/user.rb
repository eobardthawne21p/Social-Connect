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

  ROLES = %w[user moderator admin]
  validates :role, inclusion: { in: ROLES }

  # Virtual attributes for password and confirmation
  attr_accessor :password, :password_confirmation

  # Validations
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
  validates :birthday, presence: true
  validates :role, presence: true

  # Association that a user may have many posts
  has_many :posts

  # Validations for secure passwords
  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number
  validate :password_length

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

  # Method for roles
  def moderator?
    role == "moderator"
  end

  def admin?
    role == "admin"
  end
  # Associations
  has_many :likes, dependent: :destroy  # A user can have many likes

  # Custom method to get posts the user has liked
  def liked_posts
    Post.where(:id.in => self.likes.pluck(:post_id))
  end
end
