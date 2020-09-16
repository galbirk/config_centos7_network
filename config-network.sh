#! /bin/bash
sed --in-place s/^BOOTPROTO.*/'BOOTPROTO="static"'/ /etc/sysconfig/network-scripts/ifcfg-ens33
lst=('NETMASK='""$2"" 'IPADDR='""$1"" 'GATEWAY='""$3"")
for i in ${lst[@]};
  do
    echo -e $i >> /etc/sysconfig/network-scripts/ifcfg-ens33
  done
lst2=("search localomain" "nameserver $4")
for((j = 0; j < ${#lst2[@]}; j++));
  do
    echo "${lst2[$j]}" >> /etc/resolv.conf
  done
systemctl restart network
