Rails.application.routes.draw do
  root "ahbabs#index"

  get 'ahbabs/due', to: "ahbabs#list_due"
  resources :ahbabs do
    post '/toggle-activation', to: "ahbabs#toggle_activation"
    post '/mark-received', to: "ahbabs#mark_payment_received"
    resources :payments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
