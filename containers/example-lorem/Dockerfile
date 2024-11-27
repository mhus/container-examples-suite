FROM alpine:latest

RUN apk add --no-cache bash
RUN rm /usr/bin/wget /bin/su /sbin/apk

RUN adduser -D -u 1000 user

ADD run.sh /run.sh
ADD lipsum.sh /lipsum.sh

USER 1000
CMD ["/run.sh"]