require 'rails_helper'

describe Recipient do
  it "is valid with a name, email, phone and task" do
    recipient = FactoryGirl.build_stubbed(:recipient)
  	expect(recipient).to be_valid
  end

  it "is invalid without a name" do
    recipient = FactoryGirl.build_stubbed(:recipient, name: '')
  	expect(recipient).not_to be_valid
  end

  it "is invalid without a properly formatted email" do
  	recipient = FactoryGirl.build_stubbed(:recipient, email: 'notavalidemail.com' )
  	expect(recipient).not_to be_valid
  end

  it "is invalid without a valid phone number" do
  	recipient = FactoryGirl.build_stubbed(:recipient, phone: '3457')
  	expect(recipient).not_to be_valid
  end
  it "is invalid without at least one assigned task"
end