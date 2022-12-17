FROM alpine:3

RUN apk add --no-cache bash curl

COPY noip-updater /etc/periodic/hourly
RUN chmod +x /etc/periodic/hourly/noip-updater

STOPSIGNAL SIGKILL
CMD crond -f -d 8
