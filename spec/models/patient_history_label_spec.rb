require 'spec_helper'

describe PatientHistoryLabel do

  it { should have_many(:patient_histories) }

  subject { Factory.create(:patient_history_label) }

  it { should validate_presence_of(:label) }
  it { should validate_uniqueness_of(:label) }
  it { should ensure_length_of(:label).is_at_least(5).is_at_most(100)  }

	it "should be valid patient history label with non-existing label" do
		patient_history_label = Factory.build(:patient_history_label)
		patient_history_label.should be_valid
	end

end
