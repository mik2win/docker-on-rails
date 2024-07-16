#!/bin/bash
# preparing db
EDITOR="code --wait" rails credentials:edit
rails db:prepare
# fixing a server already running error
rm /app/tmp/pids/server.pid
# starting server

rails server -p 3000 -b 0.0.0.0