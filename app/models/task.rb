class Task < ApplicationRecord
  belongs_to :room
  belongs_to :user

  with_options presence: true do
    validates :task_name
    validates :start_time
  end
end
