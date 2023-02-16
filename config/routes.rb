Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'gossips#index'
  get '/team' => 'team#team_section'
  get '/contact' => 'contact#contact_section'
  get '/welcome/display' => 'welcome#welcome_display'
  get '/welcome/:id' => 'welcome#welcome_customize' # route qui va me permettre de récup l'entrée dans mon URL ex: http://localhost:3000/welcome/rintintin
  resources :users
  resources :gossips
  resources :cities
  resources :gossips do
    resources :comments
  end
  delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]
end