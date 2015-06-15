require 'rails_helper'

describe Task do
  it "is valid with an activity, message, schedule time, and completed"
  it "is invalid without an activity"
  it "is invalid without a message that's at least one character long"
  it "is invalid without a scheduled time"
  it "is invalid without a completed status"
  it "is invalid without at least one recipient"
end