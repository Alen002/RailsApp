Rails.application.routes.draw do
  devise_for :users    #do get '/users/sign_out' => 'devise/sessions#destroy'
  resources :users
  resources :first_names
  resources :products

  resources :products do
    resources :comments
  end
  resources :users


  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'



  post 'payments/create'

  root 'static_pages#landing_page'    # root 'static_pages#landing_page'

  mount ActionCable.server => '/cable' #ActionCable runs on the same process as the app

  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
