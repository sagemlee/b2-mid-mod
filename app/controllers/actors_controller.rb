class ActorsController < ApplicationController

  def add
    @movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:actor_name])
    MovieActor.create!(actor: actor, movie: @movie)
    redirect_to "/studios/#{@movie.id}"
  end

  def show
    @actor = Actor.find(params[:actor_id])
  end 
end
