require 'rails_helper'

RSpec.describe Actor do
  describe "relationships" do
    it { should have_many(:movie_actors)}
    it { should have_many(:movies).through(:movie_actors)}
  end
  describe "methods" do
    it "average_actor_age " do
      actor1= Actor.create!(name: "Lucy", age:10)
      actor2= Actor.create!(name: "Chris", age:30)
      actor3= Actor.create!(name: "John", age:50)

      actors = Actor.all

      expect(actors.average_actor_age).to eq(30)
  end

    it "young_to_old" do
      actor1= Actor.create!(name: "Lucy", age:30)
      actor2= Actor.create!(name: "Chris", age:10)
      actor3= Actor.create!(name: "John", age:50)

      actors = Actor.all

      expect(actors.young_to_old).to eq([actor2, actor1, actor3])
    end
  end
end
