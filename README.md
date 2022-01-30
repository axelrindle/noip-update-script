# noip-update-script

> Custom update script for No-IP

## Configuration

1. Create an `.env` file in the cloned directory with the following contents:

```properties
USERNAME=user@example.org
HOSTNAME=example.ddns.net
```

Change the values to suit your needs.

2. Create a file named `.password` which holds your No-IP account password. Protect the file from unauthorized access:

```shell
chmod 700 .password
```

## Usage

Just run the script:

```shell
./noip-updater
```

You probably want to install a new cron job to automatically update the hostname regularily:

```
# noip2 update
@reboot systemd-cat -t noip /bin/bash path/to/script/noip-updater
0 */1 * * * systemd-cat -t noip /bin/bash path/to/script/noip-updater
```

## License

[MIT](LICENSE)
