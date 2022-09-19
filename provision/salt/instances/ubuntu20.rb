def init(config)
    config.vm.define :ubuntu20, autostart: false do |minion_config|
        minion_config.vm.box = "bento/ubuntu-20.04"
        minion_config.vm.host_name = 'victim-ubuntu20.local'
        minion_config.vm.network "private_network", ip: "1.2.3.52"
        minion_config.vm.provision :salt do |salt|
          salt.minion_config = "#{$salt_dir}/etc/ubuntu16"
          salt.install_type = "stable"
          salt.run_highstate = true
          salt.masterless = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp"
        end
      end
end