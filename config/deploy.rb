set :application, 'fity'

fetch(:linked_files).concat %w(
  config/database.yml
  config/settings.local.rb
  config/secrets.yml
)

fetch(:linked_dirs).concat %w(
  public/uploads
)

# after "deploy:updated", "newrelic:notice_deployment"
