class Owner < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :room
end
