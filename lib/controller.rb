class Willave

    def intro

    Views.banner_willave
    Willave.greeting
     
    end

    def self.greeting
        yes_or_no = PROMPT.yes?("Are you a new user?")
        puts "\n" * 35
        if yes_or_no
            @@current_user = User.create_user
            Willave.main_menu
        else
            Willave.login
            Willave.main_menu
        end
    end

    def self.login
        login_or_exit = PROMPT.select("", %w(Login Exit Back))
        case login_or_exit
        when "Login"
            self.find_user
            self.enter_password
        when "Exit"
            Views.banner_exit
            sleep(3)
          exit   
        else "Back"  
            Willave.greeting
                
        end       
    end

    def self.find_user
        puts "\n" * 35
        find_user = PROMPT.ask("What is your name?", required: true)
        @@current_user = User.find_by(name: find_user)
        if @@current_user == nil
            puts "User not found"
            puts "Please try again!"
            self.login
        end
    end

    def self.enter_password
        enter_password = PROMPT.mask('password:', echo: true,required: true)
        if enter_password == @@current_user.password
            @@current_user
        else
            puts "Woof Woof... That was an incorrect response."
            puts "Please try again!"
            self.enter_password
        end

    end

    def self.main_menu
        Views.banner_willave     
        print "Welcome to Willave" 
        selection = PROMPT.select("Please make a selection", %w(BrowseBreeds MyFavs EditMyInfo))
        case selection
        when "BrowseBreeds"
            Willave.browse_breeds
    #     when "Your_Fav_Dog_Breeds"

    end
end
 

    def self.browse_breeds

    browse_breeds = PROMPT.select("Choose a dog breed to learn about:", %W(#{all_the_breeds}))

        
    end
    
    
    
    
    end














