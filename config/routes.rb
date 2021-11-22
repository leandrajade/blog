Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/articles' => 'articles#index' 
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create', as: 'create_article'
  get '/articles:id' => 'articles#show', as: 'show_article'
  get '/articles/:id/edit' => 'articles#edit', as: 'edit_article'
  post '/articles/:id' => 'articles#update', as: 'update_article'
  delete '/articles/:id' => 'articles#delete', as: 'delete_article'

  get '/categories' => 'categories#index'
  post '/categories' => 'category#create', as: 'create_category'
  # get '/categories/:id/edit' => 'categories#edit'
  # resources :categories
end
