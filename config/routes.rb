Rails.application.routes.draw do


  get 'userlikearticles/new'

  get 'userlikearticles/create'

  get 'userlikearticles/edit'

  get 'userlikearticles/update'

  get 'userlikearticles/delete'

  get 'userlikearticles/show'

  get 'userlikearticles/index'

  get 'articleincarts/new'

  get 'articleincarts/create'

  get 'articleincarts/show'

  get 'articleincarts/index'

  get 'articleincarts/edit'

  get 'articleincarts/update'

  get 'articleincarts/destroy'

  get 'carts/new'
  get 'carts/add_article'
  get 'carts/create'

  get 'carts/index'

  get 'carts/show'

  get 'carts/edit'

  get 'carts/update'

  get 'carts/destroy'
  get 'carts/home'
  get '/misarticulos' => 'articles#misarticulos', as: :my_articles
  resources :articles
  resources :categories
  resources :comments
  resources :answers
  devise_for :users
  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/index'

  get 'users/edit'

  get 'users/update'

  get 'users/delete'

  get 'users/home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'carts#home'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  match 'comments/new' => 'comments#new', via: [:post], as: :new_commentforparam
  match 'answers/new' => 'answers#new', via: [:post], as: :new_answertoparam


  get 'articles/:id/delete' => 'articles#delete', as: :borrar
  get 'carts/:id/delete' => 'carts#destroy', as: :borrar_cart
  get 'articleincarts/:id_cart/:id_article/destroy'  => 'articleincarts#destroy' , as: :borrar_article_in_cart
  get 'comments/:id/delete' => 'comments#destroy', as: :borrar_comment
  get 'comments/:id/add_indevido' => 'comments#add_indevido', as: :add_indevido
  

  get 'articles/:id/add_like' => 'articles#add_like', as: :add_like_to_article
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
