require 'simplecov'
SimpleCov.start
Dir[File.expand_path(File.join(File.dirname(__FILE__),'../','*.rb'))].each {|f| require f unless f.end_with?('example.rb')}
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
