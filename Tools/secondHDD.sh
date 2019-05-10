#!/bin/bash

echo "##### Second Intern HDD dedicated to storage should cause problem #####"
echo "Here is how to deal with :"
echo ""
echo "  ** HDD /dev/sdb (etiquette dos) -> /dev/sdb1 (Type ext4)"
echo ""
echo "  ** /dev/sdb1 mounted on : /HDD (should be own by julien:julien [maybe julien:sudo])"
echo ""
echo "  ** '/etc/fstab' should contains added line '/dev/sdb1 /HDD auto rw,user 0 0' to persistent mounting"
echo ""
echo "  ** WARNING : If file contains errors, host shouldn't start properly"
echo "      (if root account is disabled to log, edit/correct '/etc/fstab' should be done remotely with hub)"

exit 0