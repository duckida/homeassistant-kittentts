#!/usr/bin/with-contenv bashio

# Get configuration options
MODE=$(bashio::config 'mode')
LANGUAGE=$(bashio::config 'tts_language')

bashio::log.info "Starting Kitten TTS Server in ${MODE} mode"

# Set environment variables
export TTS_LANGUAGE=${LANGUAGE}

# Install GPU dependencies if mode is set to gpu
if [ "$MODE" = "gpu" ]; then
    bashio::log.info "Installing GPU dependencies"
    cd /app
    pip install onnxruntime-gpu
    pip install torch torchaudio --index-url https://download.pytorch.org/whl/cu121
    pip install -r requirements-nvidia.txt
fi

# Start the server
cd /app
python server.py