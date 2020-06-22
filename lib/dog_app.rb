class DogApp
#stretch - colors!!!

attr_reader :user

    def run
        intro
        login_or_signup
        faves?
    end

    def intro
        puts "*****************************"
        puts "      WELCOME TO THE         "
        puts "     DOG BREED INFO APP      "
        puts "*****************************"
        sleep(0.5)
    end
    

    def login_or_signup
        puts "Type in your name to login or sign-up:"
        answer = STDIN.gets.chomp.downcase
        @user = User.find_or_create_by(username: answer)
        sleep(0.5)
    end

    def faves?
        puts "Would you like to see your favorites? (Type yes or no)"
        answer = STDIN.gets.chomp
        if answer.downcase == "yes"
            see_your_faves
        else
            puts "Ok!"
            sleep(0.6)
            browse_breeds 
        end
    end

  
    def browse_breeds
        breeds = Breed.all
        puts "Let's browse dog breeds!"
        sleep(1.5)
        numbered_list
        sleep(0.5)
        puts "Type in the number of the dog breed that you want more information about:"
        answer = STDIN.gets.chomp
        if answer.to_i > 0 && answer.to_i <= breeds.length
            breed = Breed.all[answer.to_i - 1]
            puts "Cool, let's check it out!"
            sleep(1)
            puts "Name: "
            puts breed["name"]
            puts "Temperament: "
            puts breed["temperament"]
            puts "Life Span: "
            puts breed["life_span"]
            puts "Do you think this dog breed is awesome? Want to save it to your favorites? (yes or no)"
            answer = STDIN.gets.chomp
            if answer.downcase == "yes"
                save_user_fav(breed)
            else 
            back_or_exit
            end
        end
    end


    def numbered_list
        Breed.all.map.with_index do |breed, index|
            puts "#{index + 1}. #{breed.name}"
        end
    end


    def back_or_exit
        puts "Okay - Would you like to go back to browsing dog breeds or exit? (Type 'back' or 'exit')"
        answer = STDIN.gets.chomp
        if answer.downcase == "back"
        browse_breeds
        else system 'exit'
        end
    end

    def save_user_fav(breed)
        Favorite.find_or_create_by(breed_id: breed.id, user_id: @user.id)
        sleep(1)
        puts "Woof! That dog breed was saved to your favorites!"
        puts "Want to see all your faves(yes or no)?"
        answer = STDIN.gets.chomp
        if answer.downcase == "yes"
            see_your_faves
        else 
            back_or_exit
        end
    end


    def see_your_faves
        if @user.breeds.length == 0
            no_fav_breeds
        else
        puts "You should buy or rescue one of these breeds of dog!"
        my_breeds = @user.breeds
            my_breeds.all.map.with_index do |breed, index|
                puts "#{index + 1}. #{breed.name}"
            end
            back_or_exit
        end
    end

   
    def no_fav_breeds
        puts "You have no favorite dog breeds saved yet."
        sleep(0.5)
        browse_breeds
    end

    
end
 












