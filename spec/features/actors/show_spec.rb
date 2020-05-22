require 'rails_helper'

RSpec.describe "Studio index page", type: :feature do
  xit "displays actor, and list of actors they have worked with" do
    disney = Studio.create!(name: "Disney", location: "Los Angeles")
    warnerbros = Studio.create!(name: "Warner Brothers", location: "Southern California")

    movie1 = disney.movies.create!(title: "Movie 1", creation_year: 2011, genre: "horror")
    movie2 = warnerbros.movies.create!(title: "Movie 2", creation_year: 1999, genre: "comedy")

    actor1= Actor.create!(name: "Lucy", age:10)
    actor2= Actor.create!(name: "Chris", age:30)
    actor3= Actor.create!(name: "John", age:50)
    actor4= Actor.create!(name: "Stacy", age:20)

    MovieActor.create!(actor: actor1, movie: movie1)
    MovieActor.create!(actor: actor2, movie: movie2)
    MovieActor.create!(actor: actor3, movie: movie2)
    MovieActor.create!(actor: actor4, movie: movie2)

    visit "/actors/#{actor3.id}"

    expect(page).to have_content(actor3.name)
    expect(page).to have_content(actor3.age)
    expect(page).to have_content("Actors #{actor3.name} has worked with :")
    expect(page).to have_content(actor3.name)
    expect(page).to have_content(actor4.name)
    expect(page).to_not have_content(actor1.name)
  end
end

# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.
