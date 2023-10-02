# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'rest-client'
require 'json'

Movie.destroy_all
Bookmark.destroy_all
List.destroy_all

puts 'Getting Movies Data'

def api_key
  ENV['TMDB_API']
end

def movies_dataset
  begin
    api_data = { key: api_key }
    movies_response = RestClient.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API']}&page=1']}")
    movies_data = JSON.parse(movies_response)['results']

    if movies_data.present?
      movies_data.first(10).each do |movie|
        Movie.create(
          name: movie['title'],
          description: movie['overview'],
          poster_url: movie['poster_path'],
          rating: movie['vote_average']
        )
        puts "Seeding Movie Data: #{movie['title']}"
      end
    else
      puts 'No movie data found in the API response'
    end
  rescue RestClient::ExceptionWithResponse => e
    puts "Error: #{e.response}"
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

movies_dataset
