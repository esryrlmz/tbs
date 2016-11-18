# Load the Rails application.
require File.expand_path('../application', __FILE__)

raw_config = File.read(Rails.root.join('config').join('config.yml'))
APP_CONFIG = YAML.load(raw_config)
# Initialize the Rails application.
Rails.application.initialize!
