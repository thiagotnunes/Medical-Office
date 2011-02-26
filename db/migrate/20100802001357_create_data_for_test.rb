class CreateDataForTest < ActiveRecord::Migration
  def self.up
    TelephoneLabel.create!(:label => 'Home')
    TelephoneLabel.create!(:label => 'Work')
    TelephoneLabel.create!(:label => 'Mobile')
    AddressLabel.create!(:label => 'Home')
    AddressLabel.create!(:label => 'Work')
    HealthInsurance.create!(:name => 'SUS')
    HealthInsurance.create!(:name => 'Unimed')
    HealthInsurance.create!(:name => 'IP')
    PatientHistoryLabel.create!(:label => 'Personal')
    PatientHistoryLabel.create!(:label => 'Family')
    PatientHistoryLabel.create!(:label => 'Medical')
  end

  def self.down
  end
end
