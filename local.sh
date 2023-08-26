#######################################################
##   CONFIGURAÇÕES DE BACKUP DAS MÁQUINAS VIRTUAIS   ##
#######################################################
/bin/cp /vmfs/volumes/DAS_01/backup/smtp.xml /etc/vmware/firewall/
/bin/esxcli network firewall refresh
/bin/kill -9 $(cat /var/run/crond.pid)
/bin/echo '00 19 * * 5 /vmfs/volumes/DAS_01/backup/backup.sh -f /vmfs/volumes/DAS_01/backup/vms-backup' >> /var/spool/cron/crontabs/root
/sbin/crond
#######################################################
