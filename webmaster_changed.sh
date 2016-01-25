#/bin/bash

#создаем пользователя
useradd webmaster

#устаналиваем пароль новому пользователю
passwd webmaster

#сопоставляем роль webadm_r с SElinux пользователю staff_u
semanage user -m -R "staff_r system_r webadm_r" staff_u

#сопоставим пользователя Linux с пользователем SElinux 
semanage login -a -s staff_u -r s0-s0:c0.c1023 webmaster

#вносим изменения в файл конфигурации sudoers 
echo 'webmaster ALL=(ALL) TYPE=webadm_t ROLE=webadm_r ALL' > /etc/sudoers.d/webmaster
