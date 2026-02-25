FROM alpine/bombardier:latest AS builder

FROM debian:bookworm
#gcr.io/google.com/cloudsdktool/google-cloud-cli:stable
RUN apt update
RUN apt install curl -y

COPY --from=builder /usr/bin/bombardier /usr/bin/bombardier
COPY bombard.sh /usr/bin/bombard.sh

CMD ["bombard.sh"]
