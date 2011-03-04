class CreateUserCalendars < ActiveRecord::Migration
  def self.up
    create_table :user_calendars do |t|
      t.string :google_id
      t.string :url
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :user_calendars
  end
end
