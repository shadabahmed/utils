require 'simplecov'
SimpleCov.start
Dir[File.expand_path(File.join(File.dirname(__FILE__),'../','*lru*.rb'))].each {|f| require f unless f.end_with?('example.rb')}
