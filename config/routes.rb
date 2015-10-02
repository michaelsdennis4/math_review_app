Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/dashboard' => 'welcome#dashboard'

  get '/error' => 'welcome#error'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/sessions/new_teacher' => 'sessions#new_teacher'
  get '/sessions/new_student' => 'sessions#new_student'

  post '/teacher_login' => 'sessions#create_teacher'
  post '/student_login' => 'sessions#create_student'
  delete '/logout' => 'sessions#destroy'

  resources :sessions, only: [:new, :destroy]

  resources :teachers, except: [:destroy] do
    resources :assessments
  end

  resources :students do
    resources :assessments
  end

  resources :courses do
    resources :review_sessions, only: [:new, :create]
  end

  get 'review_sessions/:id/instructions' => 'review_sessions#instructions'

  resources :review_sessions, except: [:new, :create] do
    resources :units, only: [:new, :create]
    resources :test_questions, only: [:index, :new, :create]
    resources :assessments
  end

  resources :units, except: [:new, :create] do
    resources :topics, only: [:new, :create]
    resources :test_questions, only: [:index, :new, :create]
  end

  resources :topics, except: [:new, :create] do
    resources :review_questions, only: [:new, :create]
  end

  patch '/review_questions/:id/upload_image' => 'review_questions#upload_image'
  delete '/review_questions/:id/delete_image' => 'review_questions#delete_image'

  patch '/review_answers/:id/upload_image' => 'review_answers#upload_image'
  delete '/review_answers/:id/delete_image' => 'review_answers#delete_image'

  resources :review_questions, except: [:new, :create]

  patch '/test_questions/:id/upload_image' => 'test_questions#upload_image'
  delete '/test_questions/:id/delete_image' => 'test_questions#delete_image'

  resources :test_questions, except: [:index, :new, :create] do
    resources :choices, only: [:new, :create]
  end

  patch '/choices/:id/upload_image' => 'choices#upload_image'
  delete '/choices/:id/delete_image' => 'choices#delete_image'

  resources :choices, except: [:new, :create]

  resources :assessments do
    resources :review_sessions, only: [:show]
    resources :units, only: [:show]
    resources :topics, only: [:show]
    resources :review_questions, only: [:show]
  end

  resources :responses

  # add 404 page
  get '/*path' => 'welcome#error'

end
