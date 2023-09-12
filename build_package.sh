#!/usr/bin/env bash

echo -n "Bot Token : "
read bot
echo -n "Chat ID : "
read chat
echo -n "Which hour it triggers [HH:MM:SS] : "
read hour

sed -E "s/%BOT_TOKEN%/$bot/;s/%CHAT_ID%/$chat/;s/%HOUR%/$hour/" ./pLUM > ./pLUM-package/usr/local/bin/pLUM

chmod 700 ./pLUM-package/usr/local/bin/pLUM

sed -E "s/%HOUR%/$hour/" ./pLUM.timer > ./pLUM-package/usr/lib/systemd/system/pLUM.timer

/usr/bin/cp ./pLUM.service ./pLUM-package/usr/lib/systemd/system/

dpkg-deb --build ./pLUM-package/
