# Load the Rails application.
require File.expand_path('../application', __FILE__)

raw_config = File.read(Rails.root.join('config').join('config.yml'))
APP_CONFIG = YAML.load(raw_config)
# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => ENV['MAIL_ADDRESS'],
  :password       => ENV['PASSWORD'],
  :authentication => :plain,
  :enable_starttls_auto => true
}
