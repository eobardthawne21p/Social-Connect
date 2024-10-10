class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :image, type: Image
  field :location, type: String
  field :timeDate, type: Time
  field :likes, type: Integer
end
