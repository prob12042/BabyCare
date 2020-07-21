module BabyCare
    class CLI

        def greet
        welcome_art = Artii::Base.new
            puts welcome_art.asciify("Welcome to Baby Care!")  
            puts "------------------"
            puts "------------------"
        end

        def start
            puts "Searching for Baby Care, near you? You've come to the right place!"
            puts "What is your childs name?"

            @childs_name = gets.chomp

            puts "We look forward to helping you find care for #{@childs_name}."

            set_location
            list_babycare
            select_an_option

            while @input != "exit"
                if @input == "list"
                    list_babycare
                elsif valid?
                    display_information(Baby.find_by_number(@input))
                else
                    puts "Hhhmmm, that's not an option please try again!"
                end
                select_an_option
            end
            bye
        end

        def set_location
            puts "Tell us where you are located, so we can find the best possible care center for your child!"
            @location = gets.strip
            Baby.load_by_location(@location)
        end

        def list_babycare
            puts ""
            Baby.all.each.with_index(1) do |babycare, index|
                puts "#{index}." + "#{babycare.name}"
            end
        end  

        def list_options
            puts "Please type in the number of the Baby Care Center you wish to know more about."
            puts "To see all the options, type 'List' followed by enter."
            puts "When your done please type 'EXIT' followed by enter."
        end

        def display_information(baby_center)
            puts "#{baby_center.name} has #{baby_center.review_count} reviews with an average rating of #{baby_center.rating}."
            puts "\nContact Info:"
            puts ""
            puts baby_center.location["display_address"]
            puts baby_center.display_phone
        end

        def select_an_option
            list_babycare
            @input = gets.strip
        end

        def valid?
            @input.to_i.between?(1, Baby.all.length)
        end

        def bye
            puts "\nWe hope you found a perfect Care Center for your little one! See you soon!"
        end
        



    end
end 
