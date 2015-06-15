require 'rails_helper'

describe User do
  it "is valid with a name, email, phone" do
  	user = User.new(
  	  name: 'Sze Chan',
  	  email: 'hello@sze.codes',
  	  phone: '1234567890'
  	)
  	expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(
      name: nil,
      email: 'hello@sze.codes',
      phone: '1234567890'
    )
    expect(user).not_to be_valid
  end

  it "is invalid with a name less than 5 characters" do
   user = User.new(
      name: 'Sze',
      email: 'hello@sze.codes',
      phone: '1234567890'
    )
    expect(user).not_to be_valid 
  end

  it "is invalid without an email" do
    user = User.new(
      name: 'Sze Chan',
      email: nil,
      phone: '1234567890'
    )
    expect(user).not_to be_valid
  end

  it "is invalid without a proper format in email field" do
    user = User.new(
      name: 'Sze Chan',
      email: 'hellosze.codes',
      phone: '1234567890'
    )
    expect(user).not_to be_valid
  end

  it "is invalid without a phone" do
    user = User.new(
      name: 'Sze Chan',
      email: 'hello@sze.codes',
      phone: nil
    )
    expect(user).not_to be_valid
  end

  it "is invalid with a duplicate email" do
    User.create(
        name: 'Sze Chan',
        email: 'hello@sze.codes',
        phone: '1234567890'
      )
    other_user = User.new(
        name: 'Albertus Maximus',
        email: 'hello@sze.codes',
        phone: '1234567899'
      )
    expect(other_user).not_to be_valid
    # other_user.valid?
    # expect(other_user.errors[:email]).to include("has already been taken")
  end
end 