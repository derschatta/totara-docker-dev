FROM debian:stretch-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget

RUN cd /root/ && wget --show-progress https://github.com/mutagen-io/mutagen/releases/download/v0.10.0/mutagen_linux_amd64_v0.10.0.tar.gz \
    && tar -xzvf mutagen_linux_amd64_v0.10.0.tar.gz

COPY entrypoint.sh /root/entrypoint.sh
COPY mutagen.yml /root/mutagen.yml

RUN chmod +x /root/entrypoint.sh

CMD /root/entrypoint.sh