Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.hostname = 'project-tester'
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '8192']
    vb.customize ['modifyvm', :id, '--cpus', '4']
    vb.customize ['modifyvm', :id, '--accelerate3d', 'off']
    vb.customize ['modifyvm', :id, '--audio', 'none']
    vb.customize ['modifyvm', :id, '--usb', 'off']
    vb.customize ['modifyvm', :id, '--paravirtprovider', 'kvm']
    vb.customize ['modifyvm', :id, '--pae', 'on']
    vb.customize ['modifyvm', :id, '--largepages', 'on']
  end
  config.vm.provision('shell') {|s| s.inline = '[ -e /usr/bin/python ] || apt-get -q=2 update && apt-get -q=2 install -qq python-minimal python-apt' }
  config.vm.provision('ansible') do |ansible|
    ansible.verbose = 'v'
    ansible.playbook = 'project-tester.yml'
  end
  config.vm.network :forwarded_port, guest: 80, host: 9000
end
