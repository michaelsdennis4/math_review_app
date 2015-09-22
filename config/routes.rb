Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/dashboard' => 'welcome#dashboard'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/sessions/new_teacher' => 'sessions#new_teacher'
  get '/sessions/new_student' => 'sessions#new_student'

  post '/teacher_login' => 'sessions#create_teacher'
  post '/student_login' => 'sessions#create_student'
  delete '/logout' => 'sessions#destroy'

  resources :sessions, only: [:new, :destroy]

  resources :teachers, except: [:destroy]

  resources :students do
    resources :assessments, only: [:index]
  end

  resources :courses do
    resources :review_sessions, only: [:new, :create]
  end

  resources :review_sessions, except: [:new, :create] do
    resources :units, only: [:new, :create]
    resources :test_questions, only: [:index, :new, :create]
    resources :assessments, only: [:index]
  end

  resources :units, except: [:new, :create] do
    resources :topics, only: [:new, :create]
  end

  resources :topics, except: [:new, :create] do
    resources :review_questions, only: [:new, :create]
  end

  resources :review_questions, except: [:new, :create]

  patch '/test_questions/:id/upload' => 'test_questions#upload'

  resources :test_questions, except: [:index, :new, :create] do
    resources :choices, only: [:new, :create]
  end

  resources :choices, except: [:new, :create]

  resources :assessments

  resources :responses

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
