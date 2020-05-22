# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

disney = Studio.create!(name: "Disney", location: "Los Angeles")
warnerbros = Studio.create!(name: "Warner Brothers", location: "Southern California")
pixar = Studio.create!(name: "Pixar", location: "Studio City")

movie1 = disney.movie.create!(title: "Movie 1", creation_year: 2011, genre: "horror")
movie2 = warnerbros.movie.create!(title: "Movie 2", creation_year: 1999, genre: "comedy")
movie3 = pixar.movie.create!(title: "Movie 3", creation_year: 2005, genre: "romance")
movie4 = pixar.movie.create!(title: "Movie 4", creation_year: 2020, genre: "family")
