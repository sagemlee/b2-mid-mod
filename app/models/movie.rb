class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def self.all_actors
    Movie.movie_actors
    binding.pry
    actor.name.unique
  end
end
