class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.average_actor_age
    average(:age)
  end

  def self.young_to_old
    Actor.order(:age)
  end
end
