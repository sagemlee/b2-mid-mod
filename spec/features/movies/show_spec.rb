require 'rails_helper'

RSpec.describe "Movie Show Page", type: :feature do
  it "should display a specific movies' title, creation year, genre, and actors" do
    disney = Studio.create!(name: "Disney", location: "Los Angeles")
    movie1 = disney.movies.create!(title: "Movie 1", creation_year: 2011, genre: "horror")

    actor1= Actor.create!(name: "Lucy", age:10)
    actor2= Actor.create!(name: "Chris", age:30)
    actor3= Actor.create!(name: "John", age:50)

    MovieActor.create!(actor: actor1, movie: movie1)
    MovieActor.create!(actor: actor2, movie: movie1)
    MovieActor.create!(actor: actor3, movie: movie1)

    visit "/studios/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)

    expect(page).to have_content("Average Age of Actors: 30")
    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end
end


# Story 2
# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
