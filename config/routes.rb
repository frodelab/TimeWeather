Rails.application.routes.draw do
  get 'cities/index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cities#index'
end
