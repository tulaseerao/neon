Neon::Application.routes.draw do

  get "inventory/index"
  get "inventory/import"
  resources :timelines, :av_devices, :printers,:idevices, :devices  do
    collection { post :import }
  end
  
  devise_for :users,  :controllers => {:sessions => "sessions"},:path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}  #devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  
  get "/graph", to: "charts#graph",  as: "graph"
  get "/pie", to: "charts#pie",  as: "pie"
  get "/bar", to: "charts#bar",  as: "bar"
  get "/upload", to: "inventory#index", as: "upload_inventory" 
  post "/inventory/import", to: "inventory#import", as: "import_inventory"


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
