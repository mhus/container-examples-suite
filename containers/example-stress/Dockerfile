FROM alpine:latest

RUN apk add --no-cache stress-ng
RUN adduser -D -u 1000 user
RUN rm /usr/bin/wget /bin/su /sbin/apk

ADD run.sh /run.sh
USER 1000
WORKDIR /home/user
CMD ["/run.sh"]