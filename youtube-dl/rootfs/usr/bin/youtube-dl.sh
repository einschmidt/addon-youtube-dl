#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: youtube-dl
#
# Launch youtube-dl
# ------------------------------------------------------------------------------

main() {
    bashio::log.trace "${FUNCNAME[0]}"
    OPTIONS=$(bashio::config 'options')
    URL=$(bashio::config 'URL')

    # Run youtube-dl
    youtube-dl ${OPTIONS} ${URL}
    $(bashio::exit.ok)
}
main "$@"
