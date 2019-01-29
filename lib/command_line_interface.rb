require 'rest-client'

def welcome
  puts "Welcome to Star Wars Searchapedia!"
end

def get_character_from_user
  puts "Please Enter Character Name Here..."
  gets.chomp.downcase
end
