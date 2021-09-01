Rails.application.routes.draw do
  root "ahbabs#index"

  resources :ahbabs do
    post '/toggle-activation', to: "ahbabs#toggle_activation"
    resources :payments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
