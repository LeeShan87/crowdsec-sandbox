def init(config)
  config.vm.define :cloudlinux7, autostart: false do |minion_config|

    minion_config.vm.box = "cloudlinux/cloudlinux-7-x86_64"
    minion_config.vm.box_version = "7.4.20180412"
    minion_config.vm.host_name = 'victim-cloudlinux7.local'
    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "#{$salt_dir}/etc/cloudlinux7"
      salt.install_type = "stable"
      salt.run_highstate = true
      salt.masterless = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end
end