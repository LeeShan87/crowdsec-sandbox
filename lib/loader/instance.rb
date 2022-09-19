class Loader
	class Instance
		def initialize(path, config)
		  @logger = Log4r::Logger.new('vagrant::loader/instance')
		  @logger.info("Simple loader loading path: #{path}")
		  @path = path
		  @config = config
		 load @path
		 send('init', config)
		end
	end
end
