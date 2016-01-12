# require 'rubygems'

# ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', File.dirname(__FILE__))
# require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
# $LOAD_PATH.unshift(File.dirname(__FILE__))
# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
# require 'active_support/all'

require 'bundler/setup'
Bundler.setup

require 'active_support/all'
require 'monkey_patch_happy'

