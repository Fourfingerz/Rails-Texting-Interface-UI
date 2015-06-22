class Recipient < ActiveRecord::Base
  has_many :ownerships, dependent: :destroy
  has_many :user_ownerships, through: :ownerships, class_name: "User", foreign_key: "user_id", source: :user_id

  has_many :tasks, dependent: :destroy
  has_many :user_tasks, through: :tasks, class_name: "User", foreign_key: "user_id", source: :user

  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
				    format: { with: VALID_EMAIL_REGEX },
				    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { minimum: 7 }
end
