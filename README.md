homework 3 part one
git checkout -b cloud-bastion
reg in GCP create project Infra create 2 vm. one of them with external ip. make ssh connection.
make ssh connection without external ip: ssh -J appuser@104.199.18.67 10.132.0.3 create ssh alias for someinternalhost
(use this article https://www.cyberciti.biz/faq/linux-unix-ssh-proxycommandpassing-through-one-host-gateway-server/):
create file ~/.ssh/config: Host someinternalhost HostName 10.132.0.3 User appuser IdentityFile ~/.ssh/appuser
ProxyCommand ssh -A 104.199.18.67 nc %h %p
part two create vpn on bastion use setupvpn.sh
create organization - myorg - server - myserver user - test pin - 6214157507237678334670591556762 Port 16116/udp

bastion_IP = 104.199.18.67
someinternalhost_IP = 10.132.0.3
