# Kitten TTS Server Add-on Documentation

## Installation

1. Navigate to the Home Assistant Supervisor panel
2. Go to Add-on Store
3. Click on the three dots in the top right corner and select "Repositories"
4. Add this repository URL
5. Find "Kitten TTS Server" in the add-on store and install it
6. Configure the add-on options as needed
7. Start the add-on

## Configuration Options

- **mode**: Choose between "cpu" or "gpu" processing mode
- **tts_language**: Set the default language for text-to-speech (e.g., "en" for English)

## Using the Add-on

Once the add-on is running, you can access:

1. **Web UI**: Navigate to `http://your-home-assistant-ip:8005` to use the intuitive web interface for text-to-speech generation
2. **API Documentation**: Visit `http://your-home-assistant-ip:8005/docs` for API documentation
3. **OpenAI Compatible API**: The server also provides OpenAI-compatible endpoints

## First Run

On the first run, the add-on will automatically download the ~25MB KittenTTS model from Hugging Face. This may take a few moments depending on your internet connection.

## GPU Support

To use GPU acceleration:

1. Set the "mode" configuration option to "gpu"
2. Ensure your Home Assistant installation supports GPU passthrough
3. The add-on will automatically install the required GPU dependencies on first GPU startup

## Integration with Home Assistant

You can integrate Kitten TTS with Home Assistant using the built-in TTS platform by configuring a RESTful TTS service that points to this add-on's API.

Example configuration for configuration.yaml:

```yaml
tts:
  - platform: rest
    resource: http://localhost:8005/v1/audio/speech
    method: POST
    content_type: audio/wav
    headers:
      Content-Type: application/json
    data:
      model: "kittentts"
```

## Troubleshooting

If you encounter issues:

1. Check the add-on logs for error messages
2. Ensure your Home Assistant instance has sufficient resources
3. For GPU issues, verify that GPU passthrough is properly configured
4. For audio quality issues, try adjusting the TTS language setting