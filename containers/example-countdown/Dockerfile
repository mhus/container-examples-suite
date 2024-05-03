FROM alpine:latest

RUN adduser -D -u 1000 user

ADD run.sh /run.sh

USER 1000
CMD ["/run.sh"]