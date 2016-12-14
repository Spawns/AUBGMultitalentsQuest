Rails.application.routes.draw do
  root 'root#index'
  get 'videos/:id', to: 'root#show_video' , as: 'show_video'
  scope(:path => '/aubgquest') do
  devise_for :users, controllers: { :registrations => 'users/registrations' , :sessions => 'users/sessions', confirmations: 'users/confirmations'}
  devise_for :admins, controllers: {:sessions => 'admins/sessions'}


  namespace 'application_process' do
    get '', to: 'dashboard#index', as: '/'
    get 'status', to: 'applications#show_status' , as: 'status'
    resources :applications do
      collection do
        get 'submit'
      end
    end
    get  'create', to: 'applications#create', as: 'create_application'
    get 'status' , to: 'applications#show_status' , as: 'show_status'
    get 'editapplication' , to: 'applications#edit_application' , as: 'edit_application'
  end

  namespace :frontend do
    resources :contact_forms , only: [:new , :create]
    resources :posts , only: [:index , :show]
    resources :competition_documents , only: [:index]
    get 'processclosed' , to: 'exception#process_closed' , as: 'process_closed'
    get 'agenda' , to: 'days#index' , as:  'agenda'
    resources :partners , :only => [:index]
    resources :finalists , :only=> [:index , :show]
    get 'rules',  to: 'pages#rules' , as: 'rules'
    get 'rules1',  to: 'pages#rules1' , as: 'rules1'
    get 'accommodation',  to: 'pages#accommodation' , as: 'accommodation'
  end

  namespace :admin do
    root 'admin_index#index'
    resources :app_configs do
      get 'app_process_edit', to: 'app_configs#edit_app_process' , as: 'edit_app_process'
      post 'toggle_process', to: 'app_configs#toggle_process', as: 'toggle_process'
      post 'reset_process', to: 'app_configs#reset_process', as: 'reset_process'
    end
    resources :days do
      resources :events
    end
    resources :applications
    get 'accept_application/:id', to: 'applications#accept', as:'accept_application'
    get 'deny_application/:id', to: 'applications#deny', as:'deny_application'
    resources :competition_documents
    resources :partners
    resources :pages
    mount Ckeditor::Engine => '/ckeditor'
  end

  end

end
