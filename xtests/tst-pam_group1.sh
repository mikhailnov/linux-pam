#!/bin/bash

/usr/sbin/groupadd -p '!!' tstpamgrp
/usr/sbin/useradd -p '!!' tstpamgrp
/usr/sbin/useradd -p '!!' tstpamgrp2
./tst-pam_group1
RET=$?
/usr/sbin/userdel -r tstpamgrp 2> /dev/null
/usr/sbin/userdel -r tstpamgrp2 2> /dev/null
/usr/sbin/groupdel tstpamgrp 2> /dev/null
exit $RET
