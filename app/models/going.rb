class Going
  include Mongoid::Document

  belongs_to :user
  belongs_to :post
end
