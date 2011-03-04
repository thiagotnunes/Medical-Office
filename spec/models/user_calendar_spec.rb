require 'spec_helper'

describe UserCalendar do

  it { should belong_to(:user) }
  it { should validate_presence_of(:google_id) }
  it { should validate_presence_of(:url) }
  it { should ensure_length_of(:google_id).is_at_least(10) }
  it { should ensure_length_of(:url).is_at_least(20) }

  it "should be a valid user calendar with a google id and url" do
    user_calendar = Factory.build(:user_calendar)
    user_calendar.should be_valid
  end

end
