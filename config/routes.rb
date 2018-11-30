# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products do
    get 'show_image', :on => :collection
  end
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  get 'welcome/index'
  devise_for :users
  # For details on the DSL available within this file, see
  root "welcome#index"
end
