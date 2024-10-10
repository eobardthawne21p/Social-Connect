class ChatBoard
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :post_id, type: String
  field :user_id, type: String

  # Validations
  validates :content, presence: true
end
