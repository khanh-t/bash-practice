#!/bin/bash

echo -ne "Q01"
ls -ld /home/tran-k98

echo -ne "Q02"
ls -la /home/tran-k98

echo -ne "Q03"
man 5 passwd -P most

echo -ne "Q04"
mkdir /tmp/tran-k98

echo -ne "Q05"
echo "My file content." > /tmp/a_file.txt

echo -ne "Q06"
scp -C /tmp/a_file.txt tran-k98@127.0.0.1:/tmp/tran-k98

echo -ne "Q07"
scp -rC /etc/postfix tran-k98@127.0.0.1:/tmp/tran-k98

echo -ne "Q08"
ssh tran-k98@127.0.0.1 "rm -r /tmp/tran-k98/postfix"

echo -ne "Q09"
ls -l psaux

echo -ne "Q10"
ls -l sda

echo -ne "Q11"
ls -l log

echo -ne "Q12"
find / -type s -ls 2> /dev/null

echo -ne "Q13"
ln -s /tmp/tran-k98/a_file.txt /home/tran-k98/sym_link

echo -ne "Q14"
ln /tmp/tran-k98/a_file.txt /home/tran-k98/hard_link

echo -ne "Q15"
stat -c "File %n: Inode %i, belongs to %U" /tmp/tran-k98/a_file.txt /home/tran-k98/sym_link /home/tran-k98/hard_link

echo -ne "Q16"
echo 'The /tmp directory has the sticky bit set'

echo -ne "Q17"
echo 'Full path to edit user umask: /home/tran-k98/.bashrc'

echo -ne "Q18"
umask 177

echo -ne "Q19"
chmod 552 /tmp/tran-k98/a_file.txt

echo -ne "Q20"
chmod u+w,u-x,g-x,o-w /tmp/tran-k98/a_file.txt

echo -ne "Q21"
find / -perm 1000

echo -ne "Q22"
find /var/log -mmin 10

echo -ne "Q23"
find /usr -size -2097153c

echo -ne "Q24"

echo -ne "Q25"
alias d='date +"%Y%m%d-%I%M"'

echo -ne "Q26"
echo 'Full path to my bashrc: /home/tran-k98/.bashrc'

echo -ne "Q27"
getent passwd | wc -l

echo -ne "Q28"
getent passwd | cut -d : -f7 | sort | uniq | wc -l

echo -ne "Q29"
echo $?

echo -ne "30"
ls -z 2> /tmp/tran-k98/ls.err

echo -ne "31"
ls -z |& grep more
