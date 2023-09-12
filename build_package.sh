#!/usr/bin/env bash

echo -n "Bot Token : "
read bot
echo -n "Chat ID : "
read chat
echo -n "Which hour it triggers [HH:MM:SS] : "
read hour

/usr/bin/mkdir -p ./pLUM-package/usr/local/bin/

/usr/bin/sed -E "s/%BOT_TOKEN%/$bot/;s/%CHAT_ID%/$chat/;s/%HOUR%/$hour/" ./pLUM > ./pLUM-package/usr/local/bin/pLUM

/usr/bin/chmod 700 ./pLUM-package/usr/local/bin/pLUM

/usr/bin/mkdir -p ./pLUM-package/usr/lib/systemd/system/

/usr/bin/sed -E "s/%HOUR%/$hour/" ./pLUM.timer > ./pLUM-package/usr/lib/systemd/system/pLUM.timer

/usr/bin/cp ./pLUM.service ./pLUM-package/usr/lib/systemd/system/

/usr/bin/dpkg-deb --build ./pLUM-package/
