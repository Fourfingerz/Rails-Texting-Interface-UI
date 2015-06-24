class User < ActiveRecord::Base
	has_secure_password

	has_many :tasks
	has_many :recipients

	# has_many :ownerships, dependent: :destroy
	# has_many :recipient_ownerships, through: :ownerships, class_name: "Recipient", foreign_key: "recipient_id", source: :recipient

	# has_many :tasks, dependent: :destroy
	# has_many :recipient_tasks, through: :tasks, class_name: "Recipient", foreign_key: "recipient_id", source: :recipient

	validates :name, presence: true, length: { minimum: 5 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	validates :phone, presence: true, length: { minimum: 7 }
end
