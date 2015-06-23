class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient

  validates :user_id, presence: true
  validates :recipient_id, presence: true
end
