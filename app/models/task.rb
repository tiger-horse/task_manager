class Task < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :edit_user, class_name: 'User'
  belongs_to :category
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :task_name
    validates :start_time
  end
end
