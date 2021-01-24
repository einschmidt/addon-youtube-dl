ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Install basics
RUN apk add --no-cache \
            tzdata=2020f-r0 \
            ffmpeg=4.3.1-r3

# Install requirements for add-on
# hadolint ignore=DL3018
RUN apk add --no-cache --allow-untrusted \
            --repository http://nl.alpinelinux.org/alpine/edge/community \
            youtube-dl

# Copy root filesystem
COPY rootfs /

# Labels
LABEL \
    io.hass.name="youtube-dl" \
    io.hass.description="youtube-dl addon" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Berichta" \
    org.label-schema.description="youtube-dl addon" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="youtube-dl" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/berichta/hassio-addons" \
    org.label-schema.usage="https://github.com/berichta/hassio-addons/blob/master/youtube-dl/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/berichta/hassio-addons" \
    org.label-schema.vendor="Berichta"
