FROM alpine:latest

RUN apk add --no-cache bash curl && \
    curl -o /usr/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x /usr/bin/kubectl && \
    rm -rf /var/cache/apk/*

RUN adduser -D -u 1000 user
USER 1000

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do /usr/bin/kubectl get events --watch ${OPTIONS} ; sleep ${SLEEP:-10}; done"]
