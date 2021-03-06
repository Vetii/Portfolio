Portfolio::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # redirect welcome/index to welcome.
  get '/index(.:format)' => 'welcome#index', as: :welcome

  # redirect welcome/login to login page 
  get '/login(.:format)' => 'welcome#login', as: :login
  post '/login(.:format)' => 'welcome#log'
  delete '/login(.:format)' => 'welcome#unlog'

  # redirect welcome/resume to Curriculum
  get 'welcome/resume(.:format)' => 'welcome#curriculum'
  get '/resume(.:format)' => 'welcome#curriculum', as: :resume

  # redirect welcome/contact to contact info
  get '/contact(.:format)' => 'welcome#contact', as: :contact

  # redirecting experiments/new to the new view.
  get 'experiments/new(.:format)' => 'experiments#new'
  # redirecting experiments/:id to the "show" view
  get 'experiments/:id(.:format)' => 'experiments#show'
  #
  #redirecting experiments/ to the "index" view
  get 'experiments(.:format)' => 'experiments#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :experiments

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
