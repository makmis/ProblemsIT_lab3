# ProblemsIT_lab3
Современные проблемы информатики и вычислительной техники. Лабораторная №3
При помощи правил targeted политики selinux (в centos 7) выполнить настройку (https://www.opennet.ru/base/sec/selinux_tips.txt.html)
операционной системы так, что-бы  ограничить использование суперпользовательских (root) полномочий,
передаваемых при помощи команды sudo некоторому пользователю webmaster, назначенному администратором web-сервера.
Комнады настройки оформить в виде сценария командного интерпретатора.

Выполнение:
 1. Создаем пользователя системы webmaster: useradd webmaster и задаем ему пароль: passwd webmaster.
 2. Cоздаем SELinux пользователя: webadmin_u: semanage user -a -R "staff_r system_r webadm_r" -L s0 -r s0 webadmin_u.
	
#При создании пользователя, возникла проблема, программа semanage не усталновлена, устанавливаем: apt-get install policycoreutils. В итоге Selinux на ubuntu находиться в Disabled и не запускается с использованием команд. Посмотрев еще раз внимательно задание, в котром указано, что нужно выполнить в Centos7, скачиваю, устанавливаю его и выполняю все действия заново 1-2.
 3. Связываем пользователя linux и Selinux: semanage login -a -r s0 -s webadmin_u webmaster.
 4. Копируем шаблон staff_u в webadmin_u:
# Из-за того что модификация существующих Selinux пользователей не пощряется и для этого создаем новых пользователей. Получается данным копированием контекста, мы взяли за основу файл контекста по умолчанию, это пользователь staff_u и копировали его в webadmin_u 
 cp /etc/selinux/targeted/contexts/users/staff_u /etc/selinux/targeted/contexts/users/webadmin_u
#Можно не использовать данную команда, а ограничиться присвоением роли webadm_r c Selinux пользователем staff_u: semanage user -m -R 'staff_r webadm_r system_r' staff_u 
#Данный скрипт представлен в файле: webmaster_changed.sh
 5. Добавляем правило для sudo: echo 'webmaster ALL=(ALL) TYPE=webadm_t ROLE=webadm_r ALL' > /etc/sudoers.d/webmaster
 6. Проверяем, ок.

 
