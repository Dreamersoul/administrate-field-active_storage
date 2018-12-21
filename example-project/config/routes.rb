Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end
  delete "custom_active_record_remove", to: 'users#remove_avatar'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
