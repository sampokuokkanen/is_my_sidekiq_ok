# frozen_string_literal: true

IsMySidekiqOk::Engine.routes.draw do
  get '/', to: 'sidekiq_ok#index'
  get '/stats', to: 'sidekiq_ok#stats'
end
