Vagrant.configure("2") do |config|
    config.vm.define vm_name="tfe" do |node|
      node.vm.box = "vivien/bionic64"
      node.vm.hostname = vm_name
    end

    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
  
    config.vm.provision "shell", path: "", privileged: false/true
  end
  
