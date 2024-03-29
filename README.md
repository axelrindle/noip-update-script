[![CI](https://github.com/axelrindle/noip-update-script/actions/workflows/ci.yml/badge.svg)](https://github.com/axelrindle/noip-update-script/actions/workflows/ci.yml)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/axelrindle/noip-updater?logo=docker)](https://hub.docker.com/r/axelrindle/noip-updater)

# 🔇 This repository is archived as I moved away from No-IP.

# noip-update-script

> Custom update script for No-IP

## Configuration

1. Create an `.env` file in the cloned directory with the following contents:

```properties
USERNAME=user@example.org
HOSTNAME=example.ddns.net
PASSWORD=secret
```

2. Protect the file from unauthorized access:

```shell
chmod 600 .env
```

3. All the variables may also be read from the environment directly, so a `.env` file is not mandatory.

## Usage

Just run the script:

```shell
./noip-updater
```

## Automation

### Systemd Unit

The directory `service` contains a systemd unit as well as a systemd timer.
You might want to modify them with the correct script paths.
Place them in `~/.local/share/systemd/user/` and run the following commands to enable them:

```shell
systemctl --user enable noip.service
systemctl --user enable noip.timer
systemctl --user start noip.timer
```

### Cron

Add the following to your `crontab`:

```
# noip2 update
@reboot systemd-cat -t noip /bin/bash path/to/script/noip-updater
0 */1 * * * systemd-cat -t noip /bin/bash path/to/script/noip-updater
```

Using `@reboot` didn't work properly on my Raspberry Pi 4...

### Docker

```shell
docker run -d \
    --name noip-updater \
    -e USERNAME=example \
    -e PASSWORD=supersecret \
    -e HOSTNAME=example.ddns.net \
    axelrindle/noip-updater
```

## License

[MIT](LICENSE)
