# Airhorn Bot

Airhorn is an example implementation of the [Discord API](https://discordapp.com/developers/docs/intro). Airhorn bot utilizes the [discordgo](https://github.com/bwmarrin/discordgo) library, a free and open source library. Original credit of Airhorn Bot goes to [these guys](https://airhorn.solutions/) Airhorn Bot requires Go 1.4 or higher.

## Server Requirements

- npm
- gulp
- [go](https://golang.org/doc/install)
- [discordgo](https://github.com/bwmarrin/discordgo)
- [redis](https://redis.io/topics/quickstart)
- Firewall 6379 port open

**Firewall Change from [LinuxConfig.org](https://linuxconfig.org/how-to-open-allow-incoming-firewall-port-on-ubuntu-18-04-bionic-beaver-linux)**

```bash

sudo ufw allow from any to any port 6379 proto tcp

```

**Installing and Testing Redis from [Redis.io](https://redis.io/topics/quickstart)**

```bash

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make

##You may need to install tcl
sudo apt-get install tcl

## Next run a test
make test
## At the end you should see something like "\o/ All tests passed without errors!"


## Get redis ready for prime time (make sure you're still in ~/redis-stable directory)
sudo make install

##Start Redis
redis-server

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

   You may have to run it in the source folder: *~/go/src/github.com/EGartin/airhornbot*

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

```bash

cd ~/go/src/github.com/EGartin/airhornbot
make static

```

**Run Webserver `still a work in progress`**

```go

./airhornweb -r "localhost:6379" -i MY_APPLICATION_ID -s 'MY_APPLICATION_SECRET"

```

Note, the webserver requires a redis instance to track statistics

## Thanks

Thanks to the awesome (one might describe them as smart... loyal... appreciative...) [iopred](https://github.com/iopred) and [bwmarrin](https://github.com/bwmarrin/discordgo) for helping code review the initial release.
