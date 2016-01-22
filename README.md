# ProblemsIT_lab3
Современные проблемы информатики и вычислительной техники. Лабораторная №3
При помощи правил targeted политики selinux (в centos 7) выполнить настройку (https://www.opennet.ru/base/sec/selinux_tips.txt.html)
операционной системы так, что-бы  ограничить использование суперпользовательских (root) полномочий,
передаваемых при помощи команды sudo некоторому пользователю webmaster, назначенному администратором web-сервера.
Комнады настройки оформить в виде сценария командного интерпретатора.

Выполнение:
 1. Создаем пользователя системы webmaster: useradd webmaster и задаем ему пароль: passwd webmaster.
 2. создаем SELinux пользователя: webadmin_u: semanage user -a -R "staff_r system_r webadm_r" -L s0 -r s0 webadmin_u. При создании пользователя, возникла проблема, программа semanage не усталновлена, устанавливаем: apt-get install policycoreutils.
 3.
