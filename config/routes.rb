# frozen_string_literal: true

Rails.application.routes.draw do
  get "shops/index"
  get "shops/show"
  get "shops/create"
  get "shops/update"
  get "shops/destroy"
  namespace :api do
    namespace :v1 do
      get "health_check", to: "health_check#index"
      resources :discounts, only: [:index, :show, :create, :update, :destroy]
      resources :shops
    end
  end
end
