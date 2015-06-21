class Recipient < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, through: :user
  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
				    format: { with: VALID_EMAIL_REGEX },
				    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { minimum: 7 }
  before_save :handle_similars

  def handle_tasks
  	self.task_ids =  self.task_ids.select(&:present?).join(';')
  	# .select(&:present?) is necessary to avoid empty objects to be stored
  end

  def similars
  	self.class.find(self.task_ids.split(';'))
  end
end
