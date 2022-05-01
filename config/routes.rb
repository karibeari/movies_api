# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movie_genres
  root 'movies#index'

  resources :ratings
  resources :movie_production_companies
  resources :production_companies
  resources :genres
  resources :movies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
