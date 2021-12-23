#!/bin/bash
set -e

mbin="/usr/bin/mysql"
admin_pw=`cat /var/lib/proxysql/creds/ADMIN_PASSWORD`
lcon="-h127.0.0.1 -P6032 -uadmin -p${admin_pw}"
opts="-NB"

$mbin $lcon $opts -e"TRUNCATE TABLE stats_mysql_query_digest;"

echo "stats_mysql_query_digest cleaned up"