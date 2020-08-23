#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: youtube-dl
# Creates the global configuration file
# ==============================================================================
declare GLOBAL_CONFIG="/etc/youtube-dl.conf"

bashio::log.info "Create global configuration file

# Start creation of configuration
echo "\# Configuration" > ${GLOBAL_CONFIG}

# Add all global options to the configuration
for var in $(bashio::config 'global_options|keys'); do
  echo "$(bashio::config "global_options[${var}]") >> "${global_config}"
  bashio::log.info "global_options[${var}]"
done
