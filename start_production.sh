#!/bin/bash
cd /root/rails-postgresql
RAILS_ENV=production bundle install
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rails s > /tmp/rails_app.log 2>&1 &
