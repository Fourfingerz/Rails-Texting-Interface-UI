require 'rails_helper'

describe Recipient do
  it "is valid with a name, email, phone and task" do
  	recipient = Recipient.new(
  	  name: 'Sze Chan',
  	  email: 'hello@sze.codes',
  	  phone: '1234567890'
  	)
  	expect(user).to be_valid
  end

  it "is invalid without a name" do
  	recipient = Recipient.new(
  	  name: '',
  	  email: 'hello@sze.codes',
  	  phone: '1234567890'
  	)
  	expect(user).not_to be_valid
  end

  it "is invalid without a properly formatted email" do
  	recipient = Recipient.new(
  	  name: 'Sze Chan',
  	  email: 'hellosze.codes',
  	  phone: '1234567890'
  	)
  	expect(user).not_to be_valid
  end

  it "is invalid without a valid phone number" do
  	recipient = Recipient.new(
  	  name: 'Sze Chan',
  	  email: 'hello@sze.codes',
  	  phone: '123'
  	)
  	expect(user).not_to be_valid
  end
  it "is invalid without at least one assigned task"
end