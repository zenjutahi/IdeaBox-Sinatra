$:.unshift File.expand_path("./../lib", __FILE__) # to ensure folder system works

require 'bundler'
Bundler.require

require 'app'

run IdeaBoxApp