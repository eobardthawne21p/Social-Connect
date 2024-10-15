class SavedPost
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: String
  field :post_id, type: String
end
