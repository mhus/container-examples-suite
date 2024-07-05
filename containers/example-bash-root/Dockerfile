FROM alpine:latest

RUN apk add --no-cache bash coreutils procps util-linux findutils curl wget jq ngrep vim nano tcpdump bind-tools iproute2 iputils && \
    curl -o /usr/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x /usr/bin/kubectl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do echo $(date +%y:%m:%d-%H:%M:%S) ${MESSAGE:-}; sleep ${SLEEP:-10}; done"]
