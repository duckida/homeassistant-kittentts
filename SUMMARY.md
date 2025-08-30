# Home Assistant Add-on for Kitten-TTS-Server - Summary

## Overview
This project creates a Home Assistant add-on for the Kitten-TTS-Server, a lightweight text-to-speech engine with Web UI and API.

## Files Created

1. **config.yaml** - Add-on configuration file
   - Defines add-on metadata (name, description, version)
   - Specifies supported architectures (amd64, armv7, aarch64)
   - Configures network port (8005)
   - Sets up user configuration options (mode, language)

2. **Dockerfile** - Container build instructions
   - Uses Home Assistant base images
   - Installs required system dependencies (python, git, espeak-ng, etc.)
   - Clones the Kitten-TTS-Server repository
   - Installs Python requirements
   - Sets up the run script

3. **run.sh** - Add-on startup script
   - Uses the with-contenv bashio shebang for Home Assistant integration
   - Reads configuration options from Home Assistant
   - Installs GPU dependencies when in GPU mode
   - Starts the Kitten-TTS-Server

4. **build.yaml** - Architecture-specific base images
   - Specifies appropriate base images for different CPU architectures

5. **repository.yaml** - Repository metadata
   - Defines the add-on repository for Home Assistant

6. **README.md** - Basic documentation
   - Overview of the add-on
   - Installation instructions
   - Configuration options
   - Access information

7. **DOCS.md** - Detailed documentation
   - Comprehensive installation guide
   - Configuration options explanation
   - Usage instructions
   - Integration examples
   - Troubleshooting tips

## Features Implemented

- CPU and GPU support (configurable)
- Multi-architecture support (amd64, armv7, aarch64)
- Configurable TTS language
- Automatic model downloading
- Web UI and API access
- Proper logging integration with Home Assistant
- Shared folder access for audio files

## How to Use

1. Add this repository to your Home Assistant Supervisor
2. Install the Kitten TTS Server add-on from the Add-on Store
3. Configure the add-on options (mode, language)
4. Start the add-on
5. Access the Web UI at http://your-home-assistant-ip:8005
6. Use the API endpoints for integration with Home Assistant TTS platform

## Notes

- The add-on automatically downloads the required model on first run
- GPU mode installs additional dependencies at runtime
- All user data is stored in the add-on's data directory
- The add-on follows Home Assistant's security and packaging guidelines