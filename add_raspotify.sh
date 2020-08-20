#install raspotify
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

#remove default config-file, so custom can be edited
sudo rm /etc/default/raspotify

#write config-file new
##################################contains user credentials that must be filled out
echo "# /etc/default/raspotify -- Arguments/configuration for librespot" | sudo tee -a /etc/default/raspotify
echo "" | sudo tee -a /etc/default/raspotify
echo "# Device name on Spotify Connect" | sudo tee -a /etc/default/raspotify
echo "DEVICE_NAME=\"raspotify\"" | sudo tee -a /etc/default/raspotify
echo "" | sudo xtee -a /etc/default/raspotify
echo "# Bitrate, one of 96 (low quality), 160 (default quality), or 320 (high quality)" | sudo tee -a /etc/default/raspotify
echo "BITRATE=\"320\"" | sudo tee -a /etc/default/raspotify
echo "" | sudo tee -a /etc/default/raspotify
echo "# Additional command line arguments for librespot can be set below." | sudo tee -a /etc/default/raspotify
echo "# See ``librespot -h`` for more info. Make sure whatever arguments you specify" | sudo tee -a /etc/default/raspotify
echo "# aren't already covered by other variables in this file. (See the daemon's" | sudo tee -a /etc/default/raspotify
echo "# config at ``/lib/systemd/system/raspotify.service`` for more technical details.)" | sudo tee -a /etc/default/raspotify
echo "#" | sudo tee -a /etc/default/raspotify
echo "# To make your device visible on Spotify Connect across the Internet add your" | sudo tee -a /etc/default/raspotify
echo "# username and password which can be set via \"Set device password\", on your" | sudo tee -a /etc/default/raspotify
echo "# account settings, use ``--username`` and ``--password``." | sudo tee -a /etc/default/raspotify
echo "#" | sudo tee -a /etc/default/raspotify
echo "# To choose a different output device (ie a USB audio dongle or HDMI audio out)," | sudo tee -a /etc/default/raspotify
echo "# use ``--device`` with something like ``--device hw:0,1``. Your mileage may vary." | sudo tee -a /etc/default/raspotify
echo "#" | sudo tee -a /etc/default/raspotify
# you need to enter your user credentials here beforehand
echo "OPTIONS=\"--username <username> --password <password> --device hw:1,0\"" | sudo tee -a /etc/default/raspotify
echo "" | sudo tee -a /etc/default/raspotify
echo "# Uncomment to use a cache for downloaded audio files. Cache is disabled by" | sudo tee -a /etc/default/raspotify
echo "# default. It's best to leave this as-is if you want to use it, since" | sudo tee -a /etc/default/raspotify
echo "# permissions are properly set on the directory ``/var/cache/raspotify'." | sudo tee -a /etc/default/raspotify
echo "#CACHE_ARGS=\"--cache /var/cache/raspotify\"" | sudo tee -a /etc/default/raspotify
echo "" | sudo tee -a /etc/default/raspotify
echo "# By default, the volume normalization is enabled, add alternative volume" | sudo tee -a /etc/default/raspotify
echo "# arguments here if you'd like, but these should be fine." | sudo tee -a /etc/default/raspotify
echo "# VOLUME_ARGS=\"--enable-volume-normalisation --linear-volume --initial-volume=100\"" | sudo tee -a /etc/default/raspotify
echo "" | sudo tee -a /etc/default/raspotify
echo "# Backend could be set to pipe here, but it's for very advanced use cases of" | sudo tee -a /etc/default/raspotify
echo "# librespot, so you shouldn't need to change this under normal circumstances." | sudo tee -a /etc/default/raspotify
echo "#BACKEND_ARGS=\"--backend alsa\"" | sudo tee -a /etc/default/raspotify

#restart service
sudo systemctl restart raspotify.service
