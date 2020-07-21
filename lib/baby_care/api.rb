module BabyCare 
    class API
      API_HOST = "https://api.yelp.com"      
      SEARCH_PATH = "/v3/businesses/search"  
      BUSINESS_PATH = "/v3/businesses/"      
      def self.api_key 
        begin
          @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip      
        rescue 
          puts "Whoops! Looks like you haven't added your Yelp API key yet!"  
          @@key = gets.strip    #stores key 
          return if @@key == "exit"
          File.open(File.expand_path("~/.yelp-api-key"), "w") do |file|
            file.print @@key
          end
        end
        @@key
      end
      def self.yelp_search(term, location)
        url = "#{API_HOST}#{SEARCH_PATH}"
        params = {term: term, location: location}
        response = HTTP.auth("Bearer #{api_key}").get(url, params: params) 
        JSON.parse(response)["businesses"]
      end
    end
  end


















# module BabyCare
#     class API
#         API_HOST = "https://api.yelp.com"
#         SEARCH_PATH = "/v3/businesses/search"
#         BUSINESS_PATH = "/v3/businesses/"
#         def self.api_key
#             begin
#                 @@key = File.open(File.expand_path("~/.yelp-api-key")).read.strip
#             rescue
#                 puts "WHOOPS!, Please make sure you added your Yelp API KEY."
#                 @@key = gets.strip
#                 return if @@key == "exit"
#                 File.open(File.expand_path("~/.yelp-api_key"), "w") do |file|
#                     file.print @@key
#                 end
#             end
#             @@key
#         end

#         def self.yelp_search(term, location)
#             url = "#{API_HOST}#{SEARCH_PATH}"
#             params = {terms: term, location: location}
#             response = HTTP.auth("Bearer #{api_key}").get(url, params: params)
#             JSON.parse(response)["businesses"]
#         end
#     end
# end