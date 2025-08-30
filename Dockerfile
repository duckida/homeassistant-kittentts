ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache 
    python3 
    py3-pip 
    git 
    espeak 
    libsndfile-dev 
    ffmpeg

# Create a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Python 3 serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /app

# Clone the Kitten-TTS-Server repository
RUN git clone https://github.com/devnen/Kitten-TTS-Server.git .

# Install build dependencies for onnxruntime
RUN apk add --no-cache build-base cmake linux-headers

# Install Python requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# For GPU support, we'll install additional packages at runtime based on config
# Install build dependencies for potential GPU support
RUN pip install --upgrade pip
RUN pip install onnxruntime-gpu || echo "onnxruntime-gpu not installed, using CPU only"

# Expose port
EXPOSE 8005

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]