Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'admins/index'
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end
  
  namespace :users_backoffice do
    get 'welcome/index'
  end
 
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
  end
  namespace :profiles_backoffice do
    get 'welcome/index'
  end

  devise_for :admins
  devise_for :users
  

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
