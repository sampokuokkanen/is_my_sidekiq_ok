# frozen_string_literal: true

require 'test_helper'

class IsMySidekiqOkTest < ActiveSupport::TestCase
  GOOD_STATS = {
    processed: 0,
    failed: 0,
    scheduled_size: 0,
    retry_size: 0,
    dead_size: 0,
    processes_size: 5,
    default_queue_latency: 0,
    workers_size: 5,
    enqueued: 0
  }.freeze

  BAD_STATS = {
    processed: 0,
    failed: 0,
    scheduled_size: 0,
    retry_size: 0,
    dead_size: 0,
    default_queue_latency: 100,
    processes_size: 0,
    workers_size: 0,
    enqueued: 100
  }.freeze

  test 'it has a version number' do
    assert IsMySidekiqOk::VERSION
  end

  test 'it can be configured' do
    IsMySidekiqOk.configure do |config|
      config.processes_size = 1
      config.default_queue_latency = 30
      config.workers_size = 5
    end
    assert_equal 5, IsMySidekiqOk.config.workers_size
    assert_equal 30, IsMySidekiqOk.config.default_queue_latency
    assert_equal 1, IsMySidekiqOk.config.processes_size
  end

  test 'it checks the stats to see if they are ok' do
    assert IsMySidekiqOk.ok?(GOOD_STATS)
  end

  test 'worker size is too small and we are out' do
    stats = GOOD_STATS.merge(processes_size: 0)
    refute IsMySidekiqOk.ok?(stats)
  end

  test 'bad stats are bad' do
    refute IsMySidekiqOk.ok?(BAD_STATS)
  end
end
