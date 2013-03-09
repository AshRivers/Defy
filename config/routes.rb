Defy::Application.routes.draw do
  
  get "pictures/index"

  get "pictures/create"

  get "pictures/destroy"

  get "log_in" => "sessions#new", as: :login
  get "log_out" => "sessions#destroy", as: :logout
  get "pre_play" => "storypoints#press_play", as: :press_play
  get "plots/:id/play" => "storypoints#play", as: :play

  get "sign_up" => "users#new", as: :sign_up

  match "storypoints/:id/set_plot_id" => "storypoints#set_plot_id"
  
  match "storypoints/show_all_storypoints" => "storypoints#show_all_stp", as: :all_stp, via: :get
  match "storypoints" => "storypoints#index", as: :storypoints, via: :get
  get "plots/0" => "storypoints#index"
  #match 'storypoints', controller: 'storypoints', action: 'show_all_stp'

  resources :plots do
      resources :storypoints
  end

  resources :users
  resources :sessions
  get "welcome/main"

  resources :ways

  resources :pictures, only: [:index,:create, :destroy]
  #resources :storypoints do
  #      get "set_plot_id", on: :collection
  #    end 

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

  root to: 'welcome#main'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
