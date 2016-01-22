#/bin/bash

# creating user
useradd webmaster

#setting password
passwd webmaster


# create SELinux user
semanage user -a -R "staff_r system_r webadm_r" -L s0 -r s0 webadmin_u

#link SELinux user and system user
semanage login -a -r s0 -s webadm_u webmaster

#copy template
cp /etc/selinux/targeted/contexts/users/staff_u /etc/selinux/targeted/contexts/users/webadmin_u

#add sudoers rule
echo 'webmaster ALL=(ALL) TYPE=webadm_t ROLE=webadm_r ALL' > /etc/sudoers.d/webmaster
