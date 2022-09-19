def init(config)
    config.vm.define :opensuse423, autostart: false do |minion_config|
        minion_config.vm.box = "bento/opensuse-leap-42.3"
        minion_config.vm.host_name = 'victim-opensuse42.3'
        minion_config.vm.network "private_network", ip: "1.2.3.90"
        minion_config.vm.provision :salt do |salt|
          salt.minion_config = "#{$salt_dir}/etc/opensuse42.3"
          salt.install_type = "stable"
          salt.run_highstate = true
          salt.masterless = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp"
        end
    end
end