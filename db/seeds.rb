# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

puts "erasing existing datas"
Movie.destroy_all

puts "fetch api"
url = "http://tmdb.lewagon.com/movie/top_rated?>"
result = URI.open(url).read
movies = JSON.parse(result)


movies["results"].each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
end

puts "db seeded"
# we have an array of hashes
# we need to get our array with hash_result["results"]
# each element of this array is an hash
# eaxh hash contains a movie
