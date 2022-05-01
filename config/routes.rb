# frozen_string_literal: true

Rails.application.routes.draw do
  root 'movies#index'

  resources :movies, only: :index
  resources :production_companies, only: [:index, :show]
  get "/genres/:year", to: "genres#index"
end
