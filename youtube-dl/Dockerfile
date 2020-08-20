ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache \
    tzdata \
  	ffmpeg=4.3.1-r0 \
    youtube-dl=2020.07.28-r0

# Copy root filesystem
COPY rootfs /
