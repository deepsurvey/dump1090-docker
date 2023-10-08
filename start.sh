#!/usr/bin/env bash
set -e
echo "Settings verified, proceeding with startup."

echo " "# Start adsbcot and put it in the background.
#cd /usr/share/adsbcot
# adsbcot -U tcp:x.x.x.x:8087 -D tcp+beast:127.0.0.1:30005 &
/usr/local/bin/adsbcot -c /etc/adsbcot.ini & 
# Wait for any services to exit.
wait -n
