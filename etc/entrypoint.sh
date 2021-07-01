#!/bin/bash 

echo "running..."
chown user.user -R /home/user
/usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
