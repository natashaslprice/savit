# require 'net/http'


 # desc "Ping our heroku dyno every 10, 60 or 3600 min"
 # task :start do
 #   puts "Making the attempt to ping the dyno"

 #   if ENV['URL']
 #     puts "Sending ping"

 #     uri = URI(ENV['URL'])
 #     Net::HTTP.get_response(uri)

 #     puts "success..."
 #   end
 # end


desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  
  puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end


