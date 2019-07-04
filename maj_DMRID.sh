#!/bin/bash
ls /xlxd/
echo "Delet /xlxd/dmrid.dat"
rm /xlxd/dmrid.dat
ls /xlxd/
echo "Creat /xlxd/dmrid.dat"
wget -O /xlxd/dmrid.dat http://xlxapi.rlx.lu/api/exportdmr.php
ls /xlxd/
