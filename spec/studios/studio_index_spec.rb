require 'rails_helper'

RSpec.describe "Studio index page" do
  it "should display all movie studios, each studio should also have a list of its movies" do
    disney = Studio.create!(name: "Disney", location: "Los Angeles")
    warnerbros = Studio.create!(name: "Warner Brothers", location: "Southern California")
    pixar = Studio.create!(name: "Pixar", location: "Studio City")


  end
end




# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
