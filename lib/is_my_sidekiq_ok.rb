# frozen_string_literal: true

require 'is_my_sidekiq_ok/version'
require 'is_my_sidekiq_ok/engine'
require 'dry-configurable'

# IsMySidekiqOk checks whether Sidekiq is running and is working
# within the parameters specified in the initializer.
module IsMySidekiqOk
  extend Dry::Configurable

  module_function

  setting :status_symbol, default: :ok
  setting :error_symbol, default: :internal_server_error
  setting :processes_size, default: 4
  setting :default_queue_latency, default: 30
  setting :workers_size, default: 0
  setting :enqueued, default: 50

  setting :name
  setting :password

  SETTINGS = %i[processes_size].freeze

  # TODO: refactor this
  def ok?(stats)
    return false if SETTINGS.any? { |setting| stats[setting] <= IsMySidekiqOk.config.send(setting) }

    return false if stats[:default_queue_latency] >= IsMySidekiqOk.config.default_queue_latency

    return false if stats[:enqueued] >= IsMySidekiqOk.config.enqueued

    return false if stats[:workers_size] >= IsMySidekiqOk.config.enqueued

    true
  end
end
