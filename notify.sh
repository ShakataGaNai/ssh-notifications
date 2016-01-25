#!/bin/sh
if [ "$PAM_TYPE" != "close_session" ]; then

# Slack
        url="YOUR_SLACK_WEBHOOK_URL"
        channel="#YOUR-SLACK-CHANNEL"
        host="`hostname`"
    content="\"attachments\": [ { \"mrkdwn_in\": [\"text\", \"fallback\"], \"fallback\": \"SSH login: $PAM_USER connected to \`$host\`\", \"text\": \"SSH login to \`$host\`\", \"fields\": [ { \"title\": \"User\", \"value\": \"$PAM_USER\", \"short\": true }, { \"title\": \"IP Address\", \"value\": \"$PAM_RHOST\", \"short\": true } ], \"color\": \"#F35A00\" } ]"
    curl -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"mrkdwn\": true, \"username\": \"ssh-bot\", $content, \"icon_emoji\": \":computer:\"}" $url &

# PushBullet
    curl --header 'Access-Token: YOUR_ACCESS_TOKEN' \
         --header 'Content-Type: application/json' \
         --data-binary "{\"body\":\"User: $PAM_USER\nIP Address: $PAM_RHOST\",\"title\":\"SSH login: $PAM_USER connected to \`$host\`\",\"type\":\"note\"}" \
         --request POST \
         https://api.pushbullet.com/v2/pushes &
fi
