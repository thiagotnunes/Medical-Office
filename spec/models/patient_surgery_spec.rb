require 'spec_helper'

describe PatientSurgery do

  it { should belong_to(:patient) }

  it { should validate_presence_of(:surgery_date) }
  it { should validate_presence_of(:surgery_performed_at) }
  it { should validate_presence_of(:surgery_description) }
  it { should validate_presence_of(:diagnosis) }
  
  it { should ensure_length_of(:indicated_conduct).is_at_most(250) }
  it { should ensure_length_of(:cid).is_at_most(30) }
  it { should ensure_length_of(:surgery_performed_at).is_at_most(250) }
  it { should ensure_length_of(:surgery_anesthethist).is_at_most(250) }
  it { should ensure_length_of(:po_imediate_result).is_at_most(250) }
  it { should ensure_length_of(:pathology_material).is_at_most(50) }
  it { should ensure_length_of(:pathology_result).is_at_most(250) }
  it { should ensure_length_of(:diagnosis).is_at_most(250) }
  
  it "should be valid patient surgery with valid attributes" do
    patient_surgery = Factory.build(:patient_surgery)
    patient_surgery.should be_valid
  end
  
end
