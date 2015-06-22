FactoryGirl.define do  factory :ownership do
    user_id 1
recipient_id 1
  end
  factory :user_recipient do
    user_id 1
recipient_id 1
  end

  factory :user do
  	name "Sample User"
  	email "example@user.com"
  	phone "00000000000"
  	password_digest "secret"
  end

  factory :recipient do
    name "Jon Snow"
    email "commander@nightwatch.com"
    phone "1234567890"
    user_id "1"
  end

end