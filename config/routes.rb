Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'gossips#index'
  get '/team' => 'team#team_section'
  get '/contact' => 'contact#contact_section'
  get '/welcome/display' => 'welcome#welcome_display'
  get '/welcome/:id' => 'welcome#welcome_customize' # route qui va me permettre de récup l'entrée dans mon URL ex: http://localhost:3000/welcome/rintintin
  # get '/:id/' => 'gossip#gossip_section'
  resources :gossips
end