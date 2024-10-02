class Like
  include Mongoid::Document
  include Mongoid::Timestamps
  field :post_id, type: String
  field :user_id, type: String
end
