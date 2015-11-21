class User < ActiveRecord::Base
  has_one :group
  belongs_to_many :groups
end
