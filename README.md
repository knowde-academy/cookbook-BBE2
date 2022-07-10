git clone https://github.com/knowde-academy/cookbook-BBE2.git cookbook
cd cookbook
rvm install "ruby-2.7.4
sudo yum install postgresql96*
sudo service postgresql96 initdb
service postgresql96 start
sudo su postgres -c psql
CREATE USER "ec2-user" SUPERUSER;
\q
bundle install
rails db:create
rails db:migrate
rails s
