FROM alpine:latest

RUN apk add --no-cache bash coreutils procps util-linux findutils curl wget jq ngrep vim nano tcpdump bind-tools iproute2 iputils

RUN adduser -D -u 1000 user
USER 1000

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do echo $(date +%y:%m:%d-%H:%M:%S) ${MESSAGE:-}; sleep ${SLEEP:-10}; done"]
