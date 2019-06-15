#!/bin/bash

i3-msg 'workspace 2;layout stacked; move workspace to HDMI1;' 
sleep 0.2;
alacritty -e /home/samir/marvelsoft-container/dev-container/dev-container & 
sleep 0.2;
i3-msg 'workspace 1;layout stacked; move workspace to eDP1;'
sleep 0.2;
alacritty -e /home/samir/marvelsoft-container/dev-container/attach_to_container &
alacritty -e /usr/bin/weechat -r '/connect to_the_republic; /join #the_resistence' &
sleep 0.2;
i3-msg 'workspace 3; layout stacked; move workspace to VGA1' 
sleep 1;
alacritty -e /home/ahmed/marvelsoft-container/dev-container/attach_to_container &
firefox 'https://mail.google.com/mail/u/0/#inbox' 'https://marvelsoft.atlassian.net/wiki/spaces/M/pages/120137283/Stand-up+Meeting+Notes' 'https://marvelsoft.atlassian.net/secure/Dashboard.jspa' &
