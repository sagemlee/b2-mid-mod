require 'rails_helper'

RSpec.describe "Studio index page" do
  it "should display all movie studios, each studio should also have a list of its movies" do
    disney = Studio.create!(name: "Disney", location: "Los Angeles")
    warnerbros = Studio.create!(name: "Warner Brothers", location: "Southern California")
    pixar = Studio.create!(name: "Pixar", location: "Studio City")

    movie1 = disney.movie.create!(title: "Movie 1", creation_year: 2011, genre: "horror")
    movie2 = warnerbros.movie.create!(title: "Movie 2", creation_year: 1999, genre: "comedy")
    movie3 = pixar.movie.create!(title: "Movie 3", creation_year: 2005, genre: "romance")
    movie4 = pixar.movie.create!(title: "Movie 4", creation_year: 2020, genre: "family")


    visit '/studios'

    within "#studio-#{disney.id}" do
      expect(page).to have_content("#{movie1.name}")
    end

    within "#studio-#{warnerbros.id}" do
      expect(page).to have_content("#{movie2.name}")
    end

    within "#studio-#{pixar.id}" do
      expect(page).to have_content("#{movie3.name}")
      expect(page).to have_content("#{movie4.name}")
    end

  end
end




# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
