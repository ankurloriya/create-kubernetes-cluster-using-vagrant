# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20230619.0.0"
  # config.vm.box_url = "https://app.vagrantup.com/ubuntu/boxes/focal64/versions/20230619.0.0/providers/virtualbox.box"
 


  boxes = [
    { :name => "master", :ismaster => true, :ip => "192.168.56.11",  :cpus => 2, :memory => 2048 },
    { :name => "node-01", :ismaster => false, :ip => "192.168.56.21", :cpus => 2, :memory => 1024 },
    { :name => "node-02", :ismaster => false, :ip => "192.168.56.22", :cpus => 2, :memory => 1024 }
  ]

  boxes.each do |opts|
    config.vm.define opts[:name] do |box|
      box.vm.hostname = opts[:name]
      box.vm.network :private_network, ip: opts[:ip]
 
      box.vm.provider "virtualbox" do |vb|
        vb.cpus = opts[:cpus]
        vb.memory = opts[:memory]
      end
      box.vm.provision "shell", path:"./install-kubernetes-dependencies.sh"
      if opts[:ismaster] == true then 
        box.vm.provision "shell", path:"./configure-master-node.sh"
        end
      if opts[:ismaster] == false then
        box.vm.provision "shell", path:"./configure-worker-nodes.sh"
      end

    end
  end
end