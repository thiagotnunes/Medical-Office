RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem 'paperclip'
  config.gem 'rspec', :lib => 'spec'
  config.gem 'rspec-rails', :lib => 'spec/rails'
  config.gem 'shoulda'
  config.gem 'factory_girl'
  config.gem 'capybara'
  config.gem 'gherkin'
  config.gem 'cucumber-rails', :lib => false
  config.gem 'database_cleaner'
  config.gem 'forgery'
  config.gem 'pickle'
  config.gem 'calendar_date_select'
  config.gem 'formtastic'
  config.gem 'iso-3166-country-select'
  config.gem 'validation-reflection'

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :key => '_office_session',
    :secret      => 'c336b706ba8db826c2032041c1e3bd491781f56e90cabff36bd38adf3307c6ebd9e5233d0745a901b793358840151be376978c80d97ccb7497496c0da542e11d'
  }

end

# Configure default date format for the date picker
#CalendarDateSelect.format = :finnish
