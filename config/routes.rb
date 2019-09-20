Rails.application.routes.draw do
  get 'report/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
	get 'welcome/index'
	root 'welcome#index'

	resources :projects 
	resources :tasks do
	  resources :comments
	end
	get '/tickets', to: 'report#index'
	resources :searches
	get '/tasks/ticket', to: 'tasks#tickets'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
