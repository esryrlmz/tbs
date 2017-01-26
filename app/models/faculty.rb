class Faculty < ActiveRecord::Base
  has_one :role
  has_one :event
end
