library = File.expand_path(File.dirname(__FILE__) + '/../../lib')
$LOAD_PATH.unshift library
Dir.chdir library do
  Dir["steps/*.rb"].each {|f| require f}
end