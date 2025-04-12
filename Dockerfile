FROM alpine:latest

ARG YTDL_VERSION=2025.03.31

RUN apk add --no-cache \
    ffmpeg \
    mesa-dri-gallium \
    mpv \
    pulseaudio \
    python3 \
    ttf-dejavu \
  && wget https://github.com/yt-dlp/yt-dlp/releases/download/${YTDL_VERSION}/yt-dlp \
          -O /usr/local/bin/youtube-dl \
  && chmod 0755 /usr/local/bin/youtube-dl \
  && echo "UP add volume +2" > /etc/mpv/input.conf \
  && echo "DOWN add volume -2" >> /etc/mpv/input.conf \
  && adduser -u 1000 -D mpv

USER mpv

WORKDIR /home/mpv/

CMD ["/bin/ash"]
