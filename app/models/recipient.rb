class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :ownerships, dependent: :destroy
  has_many :tasks, through: :ownerships

  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
				    format: { with: VALID_EMAIL_REGEX },
				    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { minimum: 7 }
  validates :user_id, presence: true
end
