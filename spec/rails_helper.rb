ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require_relative "support/database_cleaner"

ActiveRecord::Migration.maintain_test_schema!

OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'github',
                  'uid' => '12345',
                  'info' => {
                    'name' => 'Kit',
                    'email' => 'kit@example.com',
                    'image_url' => 'xandy.com'
                  },
                  'credentials' => { 'token' =>
                                     '123456789'
                  },
                  'extra' => {'raw_info' =>
                              { 'location' => 'Los Angeles',
                                'gravatar_id' => '123456789'
                              }
                  }
}

OmniAuth.config.add_mock(:github, omniauth_hash)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
