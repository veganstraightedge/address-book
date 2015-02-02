Rails.application.routes.draw do
  resources :regions

  root "countries#index"

  get "countries/:slug", to: "countries#show", as: :country
  resources :countries

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Example resource route with options:
  # resources :products do
  #   member do
  #     get "short"
  #     post "toggle"
  #   end
  #
  #   collection do
  #     get "sold"
  #   end
  # end

  # Example resource route with sub-resources:
  # resources :products do
  #   resources :comments, :sales
  #   resource :seller
  # end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get "recent", on: :collection
  #     end
  #   end
end
