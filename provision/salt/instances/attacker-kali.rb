def init(config)
    config.vm.define :kali, autostart: false do |minion_config|
        minion_config.vm.box = "kalilinux/rolling"
        #minion_config.vm.box = "offensive-security/kali-linux"
        minion_config.vm.host_name = 'attacker-kali.local'
        minion_config.vm.network "private_network", ip: "1.2.3.4"
        config.vm.provider "virtualbox" do |v|
            v.gui = true
            v.memory = 4000
            v.cpus = 4
            v.customize ["modifyvm", :id, "--ostype", "Debian"]
        end
        minion_config.vm.provision :salt do |salt|
         salt.minion_config = "#{$salt_dir}/etc/kali"
         salt.install_type = "stable"
         salt.run_highstate = true
         salt.verbose = true
         salt.colorize = true
         salt.bootstrap_options = "-P -c /tmp"
        end
      end
end