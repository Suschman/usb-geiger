#!/bin/sh
### BEGIN INIT INFO
# Provides:          geiger 
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: USB Geiger monitor daemon.
# Description:       Script for starting USB Geiger manager at boot time.
# You should place it in /etc/init.d/geiger and give it executable premissions: 755.
# To start it at boot time, type: 
# sudo update-rc.d geiger defaults
#
### END INIT INFO


USER='pi'
GEIGER_PATH=/home/pi/geiger-manager
case "$1" in
    start)
        su $USER -c "python $GEIGER_PATH/main.py -mb"
        echo "Starting Geiger manager on $USER "
        ;;
    stop)
        pkill -u $USER -f "python $GEIGER_PATH/main.py -mb"
        echo "Geiger manager stopped"
        ;;
    *)
        echo "Usage: /etc/init.d/geiger {start|stop}"
        exit 1
        ;;
esac
exit 0
