require 'rails_helper'

describe User do
  it "is valid with a name, email, phone" do
  	user = FactoryGirl.build_stubbed(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryGirl.build_stubbed(:user, name: '')
    expect(user).not_to be_valid
  end

  it "is invalid with a name less than 5 characters" do
   user = FactoryGirl.build_stubbed(:user, name: 'John')
    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build_stubbed(:user, email: '')
    expect(user).not_to be_valid
  end

  it "is invalid without a proper format in email field" do
    user = FactoryGirl.build_stubbed(:user, email: 'emailemail.com')
    expect(user).not_to be_valid
  end

  it "is invalid without a phone" do
    user = FactoryGirl.build_stubbed(:user, phone: '')
    expect(user).not_to be_valid
  end

  it "is invalid with a duplicate email" do
    user = FactoryGirl.build_stubbed(:user)
    other_user = User.new(
        name: 'Albertus Maximus',
        email: 'example@user.com',
        phone: '1234567899'
      )
    expect(other_user).not_to be_valid
  end
end 