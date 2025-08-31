#!/usr/bin/with-contenv bashio

# Get configuration options
MODE=$(bashio::config 'mode')
LANGUAGE=$(bashio::config 'tts_language')

bashio::log.info "Starting Kitten TTS Server in ${MODE} mode"

# Set environment variables
export TTS_LANGUAGE=${LANGUAGE}

# Install onnxruntime at runtime
bashio::log.info "Installing onnxruntime"
cd /app
pip install onnxruntime

# Start the server
cd /app
python server.py