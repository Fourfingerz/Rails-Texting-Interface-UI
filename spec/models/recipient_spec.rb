require 'rails_helper'

describe Recipient do
  it "is valid with a name, email, and phone"
  it "is invalid without a name"
  it "is invalid without a properly formatted email"
  it "is invalid without a valid phone number"
  it "is invalid without at least one assigned task"
end