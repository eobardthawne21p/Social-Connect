class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :username, type: String
  field :password, type: String
  field :birthday, type: Date

end
