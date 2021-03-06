Hataraki::Application.routes.draw do

  get "users/show"

  match "/auth/failure" => "errors#error_401"
  match "/auth/:provider/callback" => "sessions#callback"
  match "/auth" => "sessions#index", :as => :auth

  root :to => "sessions#index"

  match "/users/:user_id/guest_authentication" => "users#guest_authentication"
  match "/users/:user_id/works/:work_id" => "users#show"
  match "/users/:user_id" => "users#show_works", :as=>"user"

  match "/logout" => "application#logout"

  resources :works
  resources :guests

  # static pages
  post "/contact" => "static_pages#send_message"
  match "/404" => "errors#error_404"
  match "/401" => "errors#error_401"
  match "/500" => "errors#error_500"
  match "/:action" => "static_pages#:action"


  # resources :works, :shallow => true do
  #   resources :guests
  # end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
