require "bcrypt"

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt
  field :name, type: String
  field :username, type: String
  field :password_digest, type: String
  field :birthday, type: Date

  # Virtual attribute for password confirmation
  attr_accessor :password, :password_confirmation

  # Validations
  validates :name, :username, :birthday, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, if: -> { self.password.present? }

  # Callbacks
  before_save :hash_password
  # Method to set the password_digest (hash it before storing)
  def password=(new_password)
    if new_password.present?
      @password = new_password
      self.password_digest = BCrypt::Password.create(new_password)
    end
  end

  # Method to authenticate the user (check if password_digest is correct)
  def authenticate(password)
    return false unless password_digest # Ensures password_digest exists 
    BCrypt::Password.new(self.password_digest) == password
  end

  private

  # Hash the password before saving the user
  def hash_password
    if password.present?
      self.password_digest = BCrypt::Password.create(password)
    end
  end
end
