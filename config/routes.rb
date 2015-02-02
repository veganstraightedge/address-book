Rails.application.routes.draw do
  root "countries#index"

  resources :countries do
    resources :regions do
      resources :localities
    end

    # resources :localities
  end
end
