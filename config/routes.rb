ActionController::Routing::Routes.draw do |map|

  map.resources :sub_categories

  map.resources :categories

  map.resources :categories

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.resource :user_session
   map.resource :users, :member => {:profile=>:any,:taxes=>:any,:taxes_save=>:any,:color_logo=>:any,:update_settings=>:any,:save_settings=>:any,:misc=>:any,:permissions=>:any,:templates=>:any,:restore_color_settings=>:any}, :conditions => {:subdomain => true} 
   map.resources :clients
   map.resources :items
   map.resources :invoices
   map.login '/login', :controller => "user_sessions", :action => "new" # optional, this just sets the root route
   map.logout '/logout', :controller => "user_sessions", :action => "destroy" # optional, this just sets the root route
   map.find_domains '/find_domains', :controller => "user_sessions", :action => "find_domains" # optional, this just sets the root route
   map.signup '/signup', :controller => "users", :action => "new" # optional, this just sets the root route
   map.root :controller => "home", :action => "index" # optional, this just sets the root route


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.chain_selects
end
