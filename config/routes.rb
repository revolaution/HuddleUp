Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'welcome#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # You can have the root of your site routed with "root"
  resources :locations, only: [:show, :new, :post] do
    resources :sports, only: [:show] do
      resources :games, except: [:index] do
        resources :participatings, only: [:create ]
      end
    end
  end

  resources :users, only: [:show, :update]

  post '/locations/:location_id/sports/:sport_id/game/:game_id/team_add/:id' => 'participatings#team_add', as: "team_add"
  get '/teams/new' => 'teams#new', as: "new_team"
  post '/teams' => 'teams#create', as: "create_team"
  get '/teams/:id' => 'teams#show', as: "show_team"
  post '/teams/:id/memberships' => 'memberships#join', as: "join_team"
  delete '/teams/:id/memberships' => 'memberships#leave', as: "leave_team"
  delete '/locations/:location_id/sports/:sport_id/game/:game_id/participatings/:id' => 'participatings#leave_game', as: "leave_game"

  patch '/locations/:location_id/sports/:id/navigate' => 'sports#navigate', as: "location_sport_navigate"
  patch '/locations/:location_id/sports/:id/skill' => 'users_sports#change_skill', as: 'location_sport_skill'
end
