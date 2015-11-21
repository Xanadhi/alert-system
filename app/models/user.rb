class User < ActiveRecord::Base
  has_one :group
end
