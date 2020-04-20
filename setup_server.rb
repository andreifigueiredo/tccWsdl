puts "install gems (please be patient)..."
`bundle install`
#
# setup app
#
puts "create development database ..."
`rails db:create`
puts "set up development database ..."
`rails db:migrate`
puts "** Done! **"