Rails.application.routes.draw do

  get 'event_response/create'

  get 'event_response/destroy'

  post 'event_response/create'

  post 'event_response/destroy'

  resources :events do |variable|
    get 'event_responses', on: :member, defaults: {format: :json}
  end
  resources :event_locations
  resources :event_categories
  resources :club_slides
  resources :academic_periods
  resources :role_types
  resources :roles_users
  devise_for :users
  resources :roles
  resources :club_contacts
  resources :club_settings
  resources :club_board_of_directors
  resources :club_board_of_supervisories
  resources :assistant_consultants
  resources :club_periods do |variable|
    get 'member_list', on: :member, defaults: {format: :json}
  end
  resources :announcments
  resources :system_announcments
  resources :clubs
  resources :club_categories
  get 'unsubscribe_request' => 'roles#unsubscribe_request'
  get 'club_users' => 'roles#club_users'
  root 'clubs#index'

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
