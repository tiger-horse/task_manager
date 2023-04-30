class Task < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one :Task

  with_options presence: true do
    validates :task_name
    validates :content
    validates :start_time
  end
end
