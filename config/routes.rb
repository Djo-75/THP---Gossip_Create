Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'static_pages#index'
  get '/team', to: 'team#team_section'
  get '/contact', to: 'contact#contact_section'
  get '/welcome/display', to: 'welcome#welcome_display'
  get '/welcome/:id', to: 'welcome#welcome_customize' # route qui va me permettre de récup l'entrée dans mon URL ex: http://localhost:3000/welcome/rintintin
  get '/:id/', to: 'gossip#gossip_section'
  
  # root "articles#index"
end