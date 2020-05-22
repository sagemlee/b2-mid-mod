require 'rails_helper'

RSpec.describe "Studio index page", type: :feature  do
  it "should display all movie studios, each studio should also have a list of its movies" do
    disney = Studio.create!(name: "Disney", location: "Los Angeles")
    warnerbros = Studio.create!(name: "Warner Brothers", location: "Southern California")
    pixar = Studio.create!(name: "Pixar", location: "Studio City")

    movie1 = disney.movies.create!(title: "Movie 1", creation_year: 2011, genre: "horror")
    movie2 = warnerbros.movies.create!(title: "Movie 2", creation_year: 1999, genre: "comedy")
    movie3 = pixar.movies.create!(title: "Movie 3", creation_year: 2005, genre: "romance")
    movie4 = pixar.movies.create!(title: "Movie 4", creation_year: 2020, genre: "family")


    visit '/studios'

    within "#studio-#{disney.id}" do
      expect(page).to have_content("#{movie1.title}")
    end

    within "#studio-#{warnerbros.id}" do
      expect(page).to have_content("#{movie2.title}")
    end

    within "#studio-#{pixar.id}" do
      expect(page).to have_content("#{movie3.title}")
      expect(page).to have_content("#{movie4.title}")
    end

  end
end




# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
