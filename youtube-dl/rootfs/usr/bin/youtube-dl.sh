#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: youtube-dl
#
# Launch youtube-dl
# ------------------------------------------------------------------------------

download() {
    # Get options
    OPTIONS=$(bashio::config 'options')
    export OPTIONS

    # Run youtube-dl
    if bashio::config.has_value 'options'; then
        bashio::log.info "Run: youtube-dl '${OPTIONS}' '${URL}'"
        youtube-dl "${OPTIONS}" "${URL}"
    else
        bashio::log.notice "No options found"
        bashio::log.info "Run: youtube-dl ${URL}"
        youtube-dl "${URL}"
    fi
} 

main() {
    bashio::log.trace "${FUNCNAME[0]}"

    if bashio::config.true 'STDIN_mode'; then
        bashio::log.info "Starting in STDIN_mode..."

        while read url; do
            url="${url%\"}"
            url="${url#\"}"

            bashio::log.info "Received URL: ${url}"
            export URL="${url}"
            download
        done < /proc/1/fd/0

    else
        export URL=$(bashio::config 'URL')
        download
    fi
}
main "$@"
