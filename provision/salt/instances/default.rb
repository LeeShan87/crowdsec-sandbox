def init(config)
	config.vm.define :default do |minion_config|
        minion_config.vm.box = "#{$default_box}"
        minion_config.vm.host_name = 'victim-default.local'
        minion_config.vm.network "private_network", ip: "1.2.3.3"
        minion_config.vm.network "private_network", ip: "1.2.3.5"
        minion_config.vm.network "private_network", ip: "1.2.3.6"
        minion_config.vm.provision :salt do |salt|
          salt.minion_config = "#{$salt_dir}/etc/default"
          salt.install_type = "stable"
          salt.run_highstate = true
          salt.masterless = true
          salt.verbose = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp"
        end
      end
end