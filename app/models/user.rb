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
end