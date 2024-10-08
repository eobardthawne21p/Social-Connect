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

  # Virtual attribute for password and confirmation
  attr_accessor :password_confirmation

  # Method to set the password_digest (hash it before storing)
  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
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