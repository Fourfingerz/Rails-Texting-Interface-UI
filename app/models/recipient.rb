class Recipient < ActiveRecord::Base
  before_create :it_belongs_to_user
  belongs_to :task
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
				    format: { with: VALID_EMAIL_REGEX },
				    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { minimum: 7 }
  validates :user_id, presence: true

  def it_belongs_to_user
  	self.user_id = current_user.id
  end
end
