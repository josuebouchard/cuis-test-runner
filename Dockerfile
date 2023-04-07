FROM golang:1.20.3-alpine AS builder

COPY main.go .
RUN go build -o /main ./main.go

FROM debian:11.6-slim

# Used to run smalltalk ui:
# RUN apt-get update && \
#       apt-get -y install libxrender-dev libgl-dev libsm-dev libpulse-dev

ADD ./linux64/ /home/linux64/
COPY runTests.st /home/
COPY --from=builder /main /home
ENTRYPOINT [ "/home/main" ]