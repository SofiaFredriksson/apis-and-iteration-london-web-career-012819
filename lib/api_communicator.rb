require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get("https://www.swapi.co/api/people/")
  response_hash = JSON.parse(response_string)
  character_hash = get_character_hash(response_hash, character_name)
  if !character_hash
    puts "character not found"
    another_search
  else
    get_character_films(character_hash)
  end
end

def get_character_hash(all_characters, character_name)
  all_characters["results"].find{|character| character["name"].downcase == character_name}
end

def get_character_name(character)
  character["results"]["name"]
end

def get_character_films(character_hash)
  character_hash["films"].map do |films_url|
    film_json = RestClient.get(films_url)
    JSON.parse(film_json)
  end
end

def print_movie (film)
  puts "* " * 20
  puts " "
  puts "Title: " + film["title"]
  puts " "
end

def print_movies(films)
  films.each {
    |film| print_movie(film)
  }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if !films
    puts "no films!"
    another_search
  else
    print_movies(films)
    another_search
  end
end
