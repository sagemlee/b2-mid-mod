Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/studios', to: 'studios#index'
  get '/studios/:movie_id', to: 'movies#show'
  post '/studios/:movie_id', to: 'actors#add'
end
