require 'rubygems'
require 'validates_timeliness'
#require 'RMagick'
require 'carrierwave'
require 'simple_form'

module Bookkeeper
  class Engine < ::Rails::Engine
    isolate_namespace Bookkeeper

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
