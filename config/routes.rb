Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'static_pages#index'
  get '/team', to: 'team#team_section'
  get '/contact', to: 'contact#contact_section'
  get '/welcome', to: 'welcome#welcome_section'
  get '/users/:username', to: 'users#welcome_section'

  # root "articles#index"
end