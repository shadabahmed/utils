require_relative '../user'
require_relative '../product'
require_relative '../bill'
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

