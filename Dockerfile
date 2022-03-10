FROM alpine:3

RUN apk add --no-cache curl

COPY noip-updater /etc/periodic/hourly
RUN touch /etc/periodic/hourly/.env

CMD crond -f -l 8
