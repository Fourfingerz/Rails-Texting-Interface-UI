require 'rails_helper'

describe User do
  it "is invalid with a name, bad email, phone" do
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


  it "is invalid without an email" 


  it "is invalid without a proper format in email field" 

  it "is invalid without a phone" 


  it "is invalid with a duplicate email" 
end 