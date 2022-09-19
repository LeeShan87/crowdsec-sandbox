def init(config)
	config.vm.define :default do |minion_config|
        minion_config.vm.box = "#{$default_box}"
        minion_config.vm.host_name = 'victim-default.local'
        minion_config.vm.network "private_network", ip: "1.2.3.3"
        minion_config.vm.network "private_network", ip: "1.2.3.5"
        minion_config.vm.network "private_network", ip: "1.2.3.6"
        minion_config.vm.provision "chef_solo" do |chef|
            chef.cookbooks_path = "#{$chef_dir}"
	  end
      end
end