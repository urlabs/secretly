# frozen_string_literal: true

require_relative "../lib/api_constraint"

Rails.application.routes.draw do
  resources :posts
  passwordless_for :users

  concern :api_base do
    resources :posts, except: %i[new edit] do
      resource :like, only: %i[create destroy]
      resources :comments, except: %i[new edit]
    end
    resource :profile, except: %i[new edit] do
      resources :posts, controller: :profile_posts, only: :index
    end
  end

  scope :api do
    constraints APIConstraint.new(version: :json_api_v1) do
      concerns :api_base
    end
  end

  root "application#index"
end
