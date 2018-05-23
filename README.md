# Airhorn Bot

Airhorn is an example implementation of the [Discord API](https://discordapp.com/developers/docs/intro). Airhorn bot utilizes the [discordgo](https://github.com/bwmarrin/discordgo) library, a free and open source library. Original credit of Airhorn Bot goes to [these guys](https://airhorn.solutions/) Airhorn Bot requires Go 1.4 or higher.

## Server Requirements

- npm
- gulp
- go
- redis

## Usage

Airhorn Bot has two components, a bot client that handles the playing of loyal airhorns, and a web server that implements OAuth2 and stats. Once added to your server, airhorn bot can be summoned by running `!airhorn`.

### Running the Bot

**First install the bot:**

```go

go get github.com/EGartin/airhornbot/cmd/bot
go install github.com/EGartin/airhornbot/cmd/bot

```

 **Then run the following command:**

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
