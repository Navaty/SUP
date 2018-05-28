Rails.application.routes.draw do
  get 'report/index'

  devise_for :users
	get 'welcome/index'
	root 'welcome#index'

	resources :projects 
	resources :tasks do
	  resources :comments
	end
	resources :report
	resources :searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
