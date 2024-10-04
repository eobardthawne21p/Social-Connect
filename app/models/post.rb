class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :image, type: String
  field :location, type: String
  field :time, type: Time
  field :likes, type: Integer
end
