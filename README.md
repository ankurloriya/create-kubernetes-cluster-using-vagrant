# Kubernetes Cluster on Virtual Box using Vagrant

This script help to create Kubernetes cluster on Virtual Box with dynamic number of nodes.
Scripts help you to execute your multi-nodes scenarios. You can test your load, find bottle neck of your application.

## How to crate cluster
Create cluster require 2 primary components
1. VirtualBox
2. Vagrant

### Clone Repository
```bash
git clone https://github.com/ankurloriya/create-kubernetes-cluster-using-vagrant.git && cd create-kubernetes-cluster-using-vagrant
```

### How to install VirtualBox
```bash
sudo apt update
sudo apt install virtualbox
```

### Install Vagrant on Ubuntu
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install vagrant
```

### Create Kubernetes Cluster
Configure number of node by edit `vagrantfile`. In file there will be `box = []` variable. which you need to update of create node and and setup internal IP addresses.

After that you just execute
```bash
vagrant up
```

### Shutdown Virtual Machine
```bash
vagrant halt
```

### Remove Cluster
```bash
vagrant destroy
```


### Thank You
- [Fork scripts from Frewx gist](https://gist.github.com/Frewx)
- [Blog](https://ugurakgul.medium.com/creating-a-local-kubernetes-cluster-with-vagrant-ba591ab70ee2)