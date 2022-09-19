#require 'rbconfig'
require 'yaml'
Dir[File.join(__dir__, 'lib', 'loader','*.rb')].each { |file| require file }

config_filename = __dir__+'/config.yaml'
if File.file?(config_filename)
    config = YAML.safe_load(File.read(config_filename))
    $default_box= config['default_box']? config['default_box']: "bento/centos-7.7"
    Dir[File.join(__dir__, 'provision', config['provisioner']?config['provisioner']:'salt','*.rb')].each { |file| require file }
else
    puts "\n\n\n!!! config.yaml is missing. Please set it before start\n\n\n"
end