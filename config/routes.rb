Rails.application.routes.draw do
  devise_for :users
	resources :conversations, only: [:index, :show, :destroy] do
  	member do
    	post :reply
    	post :restore
    	post :mark_as_read
  	end
	end
	resources :conversations, only: [:index, :show, :destroy] do
  	collection do
    	delete :empty_trash
  	end
	end
  resources :messages, only: [:new, :create]
  root 'conversations#index'
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
