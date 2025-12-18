FROM alpine:latest

RUN apk add --no-cache bash curl tzdata

COPY notify.sh /notify.sh
COPY crontab /etc/crontabs/root

RUN chmod +x /notify.sh

CMD ["crond", "-f"]
