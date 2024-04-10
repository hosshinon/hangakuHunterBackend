# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "health_check", to: "health_check#index"
      resources :shops, only: [:index, :show, :create, :update, :destroy] do
        resources :discounts, only: [:create]
      end
    end
  end
end
