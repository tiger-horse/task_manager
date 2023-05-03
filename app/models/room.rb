class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_one :owner, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :categories, dependent: :destroy
  
  validates :name, presence: true
end
