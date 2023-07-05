# Kubernetes Cluster on Virtual Box

This script help to create Kubernetes cluster on Virtual Box with dynamic number of nodes.
Scripts help you to execute your multi-nodes scenarios. You can test your load, find bottle neck of your application.

## How to crate cluster
Create cluster require 2 primary components
1. VirtualBox
2. Vagrant

### How to install VirtualBox
```bash
apt update
apt install virtualbox
```

### Install Vagrant on Ubuntu
```bash
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


#### Thank You
- [How to install VirtualBox and Vagrant](https://www.fosslinux.com/69145/install-vagrant-on-ubuntu.htm)
- [Fork scripts](https://gist.github.com/Frewx) - [Blog](https://ugurakgul.medium.com/creating-a-local-kubernetes-cluster-with-vagrant-ba591ab70ee2)