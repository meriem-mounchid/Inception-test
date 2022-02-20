Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "ubuntu/trusty64"
	config.vm.define "Misaki" do |controle|
    controle.vm.hostname = "Misaki"
    controle.vm.network "public_network", bridge: "en0: Ethernet"
    controle.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--memory", "4096"]
      v.customize ["modifyvm", :id, "--name", "misaki"]
    end
  end
end