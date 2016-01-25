# ssh-notifications
Originally based off of Sandrino Di Mattia's post "[Posting successful SSH logins to Slack](http://sandrinodimattia.net/posting-successful-ssh-logins-to-slack/)".  Additional modifications as detailed in my post "[Pushing successful SSH logins to PushBullet](https://snowulf.com/?p=6983)"

## Getting Tokens
* Slack
 * Goto: https://YOUR_DOMAIN.slack.com/apps/manage/custom-integrations  
 * Custom Integrations
 * Incoming Webhooks
 * Add configuration
* PushBullet
 * Goto: https://www.pushbullet.com/#settings/account
 * "Created Access Token"

## How to use:
* cp ./notify.sh /etc/ssh/notify.sh
* chmod a+x /etc/ssh/notify.sh  
* printf "\nsession optional pam_exec.so seteuid /etc/ssh/notify.sh\n" >> /etc/pam.d/sshd
* try SSH'ing into your server

## License
This repo is licensed under:
[CC-0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) / Public Domain.
