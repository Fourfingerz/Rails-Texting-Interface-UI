class Ownership < ActiveRecord::Base
  belongs_to :task
  belongs_to :recipient

  validates :task_id, presence: true
  validates :recipient_id, presence: true
end
