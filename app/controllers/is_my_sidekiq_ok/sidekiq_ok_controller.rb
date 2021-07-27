require 'sidekiq/api'

module IsMySidekiqOk
  class SidekiqOkController < ApplicationController
    if IsMySidekiqOk.config.name.present? &&
       IsMySidekiqOk.config.password.present?
      http_basic_authenticate_with name: IsMySidekiqOk.config.name,
                                   password: IsMySidekiqOk.config.password
    end

    def index
      if IsMySidekiqOk.ok?(sidekiq_stats)
        head IsMySidekiqOk.config.status_symbol
      else
        head IsMySidekiqOk.config.error_symbol
      end
    end

    def stats
      render json: sidekiq_stats
    end

    private

    def sidekiq_stats
      ::Sidekiq::Stats.new.fetch_stats!
    end
  end
end
