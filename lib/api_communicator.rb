require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character_name)
  response_string = RestClient.get("https://www.swapi.co/api/people/")
  response_hash = JSON.parse(response_string)
  character_hash = get_character_hash(response_hash, character_name)
  get_character_films(character_hash)
end

def get_character_hash(all_characters, character_name)
  all_characters["results"].find{|character| character["name"].downcase == character_name}
end

def get_character_name(character)
  character["results"]["name"]
end

def get_character_films(character_hash)
  puts character_hash["films"]
  # if character["results"]["name"]
  #
  # else
  #   'Information Not Available.'
  # end
end




def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
