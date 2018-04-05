Rails.application.routes.draw do
  # get 'jokes/index'

  # get 'jokes/show'

  # get 'jokes/create'

  # get 'jokes/edit'

  # get 'jokes/update'

  # get 'jokes/destroy'

  # get 'home/index'

  get '/jokes/random', to: 'jokes#get_rand'
  resources :jokes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
