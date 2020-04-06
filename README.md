homework 3
part one
git checkout -b cloud-bastion
reg in GCP create project Infra create 2 vm. one of them with external ip. make ssh connection.
make ssh connection without external ip: ssh -J appuser@104.199.18.67 10.132.0.3 create ssh alias for someinternalhost
(use this article https://www.cyberciti.biz/faq/linux-unix-ssh-proxycommandpassing-through-one-host-gateway-server/):
create file ~/.ssh/config: Host someinternalhost HostName 10.132.0.3 User appuser IdentityFile ~/.ssh/appuser
ProxyCommand ssh -A 104.199.18.67 nc %h %p
part two
create vpn on bastion use setupvpn.sh
create organization - myorg - server - myserver user - test pin - 6214157507237678334670591556762 Port 16116/udp

bastion_IP = 104.199.18.67
someinternalhost_IP = 10.132.0.3

homework #4 testapp_IP = 104.199.18.67 testapp_port = 9292

create vm: gcloud compute instances create reddit-app
--zone=europe-west1-c
--boot-disk-size=10GB
--image-family ubuntu-1604-lts
--image-project=ubuntu-os-cloud
--machine-type=g1-small
--metadata-from-file startup-script=startup.sh
--tags puma-server
--restart-on-failure

create firewall rule: gcloud compute firewall-rules create "default-puma-server" --allow tcp:9292
--source-ranges="0.0.0.0/0"
--description="puma server inbound"
--target-tags="puma-server"
