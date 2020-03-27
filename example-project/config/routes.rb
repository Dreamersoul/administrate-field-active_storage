Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      delete :avatar, on: :member, action: :destroy_avatar
    end

    root to: "users#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
