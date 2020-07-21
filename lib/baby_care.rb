require "baby_care/version"
require "baby_care/api"
require "baby_care/cli"  
require "baby_care/baby" 
require "http"  


module BabyCare
  class Error < StandardError; end
  # Your code goes here...
end

#Ucc::Api.yelp_search("Urgent Care Center", "Urgent Care", "11374")
#This file loads all other files, similar to environment. 
#The environment file should be called the same as your app.  


# bin/ucc  #exectuable 
# lib/ucc   #folder 
# lib/ucc.rb   #environment