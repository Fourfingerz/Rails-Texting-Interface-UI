Rails.application.routes.draw do
  root 'static_pages#home'

  get 'recipients/new'
  get 'recipients/create'
  get 'recipients/index'

  get 'users/index'
  get 'users/show'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'users/following'
  get 'users/followers'

  get 'notifications/notify'
  get 'signup' => 'users#new'
  get 'task/create'
  post 'task/create' => 'task#create'

  get 'task/edit_recipients', to: 'tasks#edit_recipients'
  post 'task/update_recipients', to: 'tasks#update_recipients'

  get 'twilio/voice'
  post 'twilio/voice' => 'twilio#voice'

  resources :users
  resources :sessions

  resources :tasks, :only => [:new, :create, :edit, :task_update_recipients, :task_edit_recipients, :update]
  resources :recipients, :only => [:new, :create, :index]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
