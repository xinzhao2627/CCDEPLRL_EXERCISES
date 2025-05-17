# Start from NVIDIA's CUDA base image
FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04

# Install Python and virtual environment tools
RUN apt update && \
    apt install -y \
    python3-full \
    python3-venv

# Create a virtual environment
RUN python3 -m venv /opt/tf_venv

# Install TensorFlow with GPU support in the venv
RUN /opt/tf_venv/bin/pip install --upgrade pip && \
    /opt/tf_venv/bin/pip install 'tensorflow[and-cuda]'

# Set the venv as default for all users
ENV PATH="/opt/tf_venv/bin:$PATH"
