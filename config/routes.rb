Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  get 'check_entry/:participants', to: 'game_logs#need_reg'
  get 'list_game/:id', to: 'game_library#get_gameinfo'
  get 'list_member/:badge', to: 'game_library#get_memberinfo'
  get 'show_winners', to: 'winner_circle#pick_winners'
  get 'redraw/:inventory_id', to: 'winner_circle#redraw_winner'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Be careful about route placement, and restart server when adding routes
  resources :participants
  resources :game_library
  resources :game_logs
  resources :winner_circle

end