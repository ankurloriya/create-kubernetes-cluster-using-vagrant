#!/bin/bash -e

master_node=192.168.56.11
pod_network_cidr=10.244.0.0/16
echo "Master Node Config Script...."
initialize_master_node ()
{
sudo systemctl enable kubelet
sudo kubeadm config images pull
sudo kubeadm init --apiserver-advertise-address=$master_node --pod-network-cidr=$pod_network_cidr --ignore-preflight-errors=NumCPU
}

create_join_command ()
{
kubeadm token create --print-join-command | tee /vagrant/join_command.sh
chmod +x /vagrant/join_command.sh
}

configure_kubectl () 
{
mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

##For vagrant user
mkdir -p /home/vagrant/.kube
sudo cp -f /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown 900:900 /home/vagrant/.kube/config
}

install_network_cni ()
{
# kubectl apply -f /vagrant/kube-flannel.yml
kubectl apply -f https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml
}

resolve_containerd_issue ()
{
sudo mv /etc/containerd/config.toml /etc/containerd/config.toml.bck
sudo systemctl restart containerd.service
sleep 30s
}

resolve_containerd_issue

initialize_master_node
configure_kubectl
install_network_cni
create_join_command