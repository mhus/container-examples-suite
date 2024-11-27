FROM alpine:latest

RUN adduser -D -u 1000 user
RUN rm /usr/bin/wget /bin/su /sbin/apk

ADD run.sh /run.sh

USER 1000
CMD ["/run.sh"]