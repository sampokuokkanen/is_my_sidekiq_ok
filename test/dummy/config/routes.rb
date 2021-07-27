# frozen_string_literal: true

Rails.application.routes.draw do
  mount IsMySidekiqOk::Engine => '/is_my_sidekiq_ok'
end
