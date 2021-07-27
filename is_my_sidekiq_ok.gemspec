# frozen_string_literal: true

require_relative 'lib/is_my_sidekiq_ok/version'

Gem::Specification.new do |spec|
  spec.name        = 'is_my_sidekiq_ok'
  spec.version     = IsMySidekiqOk::VERSION
  spec.authors     = ['Sampo Kuokkanen']
  spec.email       = ['sampo.kuokkanen@gmail.com']
  spec.homepage    = 'https://github.com/sampokuokkanen/is_my_sidekiq_ok'
  spec.summary     = 'Is your Sidekiq ok? This gem tells you. '
  spec.description = 'Define limits and see if Sidekiq is running within those.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'rails', '~> 6.1.4'
  spec.add_development_dependency 'byebug'
end
