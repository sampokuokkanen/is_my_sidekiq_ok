# frozen_string_literal: true

require 'test_helper'
require 'sidekiq/api'
require 'minitest/mock'
class SidekiqOkTest < ActionDispatch::IntegrationTest
  setup do
    @authorization = ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret')
  end

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

  test 'the gem adds a route' do
    get '/is_my_sidekiq_ok', headers: { 'HTTP_AUTHORIZATION' => @authorization }
    assert_response :error
  end

  test 'if Sidekiq is ok, we get 200 status code' do
    sidekiq_mock = MiniTest::Mock.new
    sidekiq_mock.expect :fetch_stats!, GOOD_STATS
    ::Sidekiq::Stats.stub :new, sidekiq_mock do
      get '/is_my_sidekiq_ok', headers: { 'HTTP_AUTHORIZATION' => @authorization }
      assert_response :success
    end
  end

end
