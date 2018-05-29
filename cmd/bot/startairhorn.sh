 #!/bin/bash
 #wget is optional if you haven't downloaded the go archive yet
 wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
 
 sudo tar -C /usr/local -xzf go1.10.2.linux-amd64.tar.gz
 export PATH=$PATH:/usr/local/go/bin
 go get github.com/bwmarrin/discordgo
 go get github.com/EGartin/airhornbot/cmd/bot
 go install github.com/EGartin/airhornbot/cmd/bot
 cd go/src/github.com/EGartin/airhornbot/
 go run cmd/bot/bot.go -r "localhost:6379" -t "MY_BOT_ACCOUNT_TOKEN" -o OWNER_ID