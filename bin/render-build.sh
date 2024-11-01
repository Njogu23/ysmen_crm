#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install Ruby gems
bundle install

# Precompile assets for production
bundle exec rake assets:precompile

# Clean up old assets
bundle exec rake assets:clean

# Run database migrations
# If this is the first deployment and the database has not been created,
# uncomment the next line to set up the database
# bundle exec rake db:setup

# Run database migrations
bundle exec rake db:migrate

# Optionally, seed the database with initial data
# Uncomment the line below if your app needs seeded data on deploy
# bundle exec rake db:seed
