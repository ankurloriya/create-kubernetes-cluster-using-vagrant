#!/bin/bash -e

get_join_command ()
{
sudo /vagrant/join_command.sh
}

resolve_containerd_issue ()
{
sudo mv /etc/containerd/config.toml /etc/containerd/config.toml.bck
sudo systemctl restart containerd.service
sleep 30s
}

resolve_containerd_issue

get_join_command