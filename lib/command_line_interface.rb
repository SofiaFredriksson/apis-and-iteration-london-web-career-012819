require 'rest-client'

def welcome
  puts "Welcome to Star Wars Searchapedia!"
end

def get_character_from_user
  puts "Please Enter Character Name Here..."
  gets.chomp.downcase
end

def another_search
  puts "Would you like to search another character?"
  answer = gets.chomp.downcase
  if answer == "yes"
    character = get_character_from_user
    show_character_movies(character)
  else
      puts "Thank you for using Star Wars Searchapedia!"
      puts "Have a nice day!"
  end
end
