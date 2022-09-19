def init(config)
  config.vm.define :centos6, autostart: false do |minion_config|
    minion_config.vm.box = "bento/centos-6.10"
    minion_config.vm.host_name = 'victim-centos6.local'
    minion_config.vm.network "private_network", ip: "1.2.3.16"
    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "#{$salt_dir}/etc/centos6"
      salt.install_type = "stable"
      salt.run_highstate = true
      salt.masterless = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end
end