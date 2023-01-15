# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles, only: :index
  resources :likes, only: %i[create destroy]

  root 'articles#index'
end
