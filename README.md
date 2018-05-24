# Airhorn Bot

Airhorn is an example implementation of the [Discord API](https://discordapp.com/developers/docs/intro). Airhorn bot utilizes the [discordgo](https://github.com/bwmarrin/discordgo) library, a free and open source library. Original credit of Airhorn Bot goes to [these guys](https://airhorn.solutions/) Airhorn Bot requires Go 1.4 or higher.

## Prereqs

You need a few things from your discord client before you begin. You need to login to the [discord app](https://discordapp.com/channels/@me) in the browser and enable developer mode under `Appearance` to enable the features you need to interact with the Discord API.

- OWNER_ID (Right click yourself in a channel and "Copy ID")

You can obtain these other ones by creating an application and bot user in the "My Apps" area in the [developer area](https://discordapp.com/developers/applications/me/)

Under **App Details** (These are for the webserver *optional*)

- MY_APPLICATION_ID
- MY_APPLICATION_SECRET

You will need to *Create a Bot User* to obtain this token

- MY_BOT_ACCOUNT_TOKEN

Once you set this up, you'll need to navigate to this URL to add the bot to your discord.  However, it won't do anything just yet until you make the bot software and have it listening to the bot user token you created. Make sure you replace **<<MY_APPLICATION_ID>>** in the URL.

```html

https://discordapp.com/api/oauth2/authorize?client_id=<<MY_APPLICATION_ID>>&scope=bot&permissions=1

```

## Server Requirements

- [NPM](https://www.npmjs.com/) (npm and gulp)
- [go](https://golang.org/doc/install)
- [discordgo](https://github.com/bwmarrin/discordgo)
- [redis](https://redis.io/topics/quickstart)
- Firewall Change[LinuxConfig.org](https://linuxconfig.org/how-to-open-allow-incoming-firewall-port-on-ubuntu-18-04-bionic-beaver-linux)

### Install npm and gulp

```zsh

sudo apt install npm

```

```zsh

npm install gulp

```

### Install GO and DiscordGO

```zsh

sudo apt install golang-go
## Set your GOPATH to wherever you want. Keep this in mind if you change location.
export GOPATH=~/.go

```

Next **Download DiscordGO**.  This will be required for any programs calling the library.

```go

go get github.com/bwmarrin/discordgo

```

### Installing Redis

**Installing Redis from [Redis.io](https://redis.io/topics/quickstart)**

```zsh

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make

##You need to install tcl before you run your `make test`
sudo apt-get install tcl

```

Next **Test Redis**

```zsh

## Next run a test
make test

## At the end you should see something like "\o/ All tests passed without errors!"

## Get redis ready for prime time (make sure you're still in ~/redis-stable directory)
sudo make install

##Manually Start Redis
redis-server

##Daemonize Redis to run server in the background
redis-server --daemonize yes

```

**Firewall Change from [LinuxConfig.org](https://linuxconfig.org/how-to-open-allow-incoming-firewall-port-on-ubuntu-18-04-bionic-beaver-linux)**

```zsh

sudo ufw allow from any to any port 6379 proto tcp

```

## Usage

Airhorn Bot has two components, a bot client that handles the playing of loyal airhorns, and a web server that implements OAuth2 and stats. Once added to your server, airhorn bot can be summoned by running `!airhorn`.

### Running the Bot

**First install the bot:**

```go

go get github.com/EGartin/airhornbot/cmd/bot
go install github.com/EGartin/airhornbot/cmd/bot

```

 **Then run the following command:**

   You may have to run it in the source folder: *cd ~$GOPATH/github.com/EGartin/airhornbot*

```go

bot -r "localhost:6379" -t "MY_BOT_ACCOUNT_TOKEN" -o OWNER_ID

```

### Running the Web Server

**First install the webserver:**

```go

go get github.com/EGartin/airhornbot/cmd/webserver
go install github.com/EGartin/airhornbot/cmd/webserver

```

**Next run `make static` on the repo in your `~/go/src/github.com/EGartin/airhornbot` repo**

```zsh

cd ~$GOPATH/github.com/EGartin/airhornbot
make static

```

**Run Webserver `still a work in progress`**

```go

./airhornweb -r "localhost:6379" -i MY_APPLICATION_ID -s "MY_APPLICATION_SECRET"

```

Note, the webserver requires a redis instance to track statistics

## DevOps Automation

Coming Soon. Feel free to follow along with the new Issue tracker and Github Project on this Repo

## Thanks

Thanks to the awesome (one might describe them as smart... loyal... appreciative...) [iopred](https://github.com/iopred) and [bwmarrin](https://github.com/bwmarrin/discordgo) for helping code review the initial release.
