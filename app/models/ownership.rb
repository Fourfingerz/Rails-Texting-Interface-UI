class Ownership < ActiveRecord::Base
  belongs_to :user, touch: true
  belongs_to :recipient, touch: true
end
