class UserCalendar < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :google_id, :url
  validates_length_of :google_id, :minimum => 10
  validates_length_of :url, :minimum => 20

end
