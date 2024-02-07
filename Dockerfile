FROM tinygo/tinygo:0.29.0 AS builder

WORKDIR /workspace

COPY golang/. .

ENV GOOS=linux
ENV GOARCH=386
RUN tinygo build -o full

FROM rancher/busybox:1.31.1

WORKDIR /app

COPY --from=builder /workspace/full .

CMD ["./full"]