require 'dragonfly'

require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "110c31b6cc79ecbd8faf339f58fef6732a16a71e2bc237ac4ddcd7b1091ea533"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: 'math-review',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'us-west-2'
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
