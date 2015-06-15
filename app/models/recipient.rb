class Recipient < ActiveRecord::Base
	belongs_to :task
	validates :name, presence: true, length: { minimum: 5 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	validates :phone, presence: true, length: { minimum: 7 }
end
