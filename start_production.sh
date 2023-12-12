cd /root/rails-postgresql
source /usr/local/rvm/scripts/rvm 
rvm use 3.2.1
RAILS_ENV=production bundle install
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rails s > /tmp/rails_app.log 2>&1 &