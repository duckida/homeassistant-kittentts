# Kitten TTS Server Add-on for Home Assistant

This add-on runs the [Kitten-TTS-Server](https://github.com/devnen/Kitten-TTS-Server), a self-hosted, ultra-lightweight text-to-speech engine with a Web UI and API.

## Features

- Intuitive Web UI for easy text-to-speech generation
- Lightweight model (15M parameters, <25MB)
- API with both standard and OpenAI-compatible endpoints
- CPU and GPU support
- Large text processing for audiobook generation

## Installation

1. Add this repository to your Home Assistant Supervisor
2. Navigate to Supervisor > Add-on Store
3. Find "Kitten TTS Server" and install it
4. Start the add-on and access the Web UI

## Configuration

- **Mode**: Choose between CPU or GPU processing
- **Language**: Set the default TTS language

## Access

- Web UI: `http://your-home-assistant-ip:8005`
- API Docs: `http://your-home-assistant-ip:8005/docs`

## Repository Structure

This repository contains the following files for the Home Assistant add-on:

- `config.yaml`: Add-on configuration and metadata
- `Dockerfile`: Container image definition
- `run.sh`: Add-on startup script
- `build.yaml`: Base image specifications for different architectures
- `README.md`: This file
- `DOCS.md`: Detailed documentation
- `repository.yaml`: Repository metadata

## Notes

- First run will automatically download the ~25MB KittenTTS model from Hugging Face
- For GPU support, ensure your Home Assistant installation supports GPU passthrough