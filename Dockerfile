# Copyright@SCLBD
# Dockerfile for DeepFakeBench

FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

LABEL maintainer="Deepfake"

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    automake \
    build-essential \
    cmake \
    pkg-config \
    libtool \
    ca-certificates \
    libfreetype6-dev \
    python3-dev \
    python3-pip \
    ffmpeg \
    libavcodec-dev \
    libavformat-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavutil-dev \
    libswscale-dev \
    libswresample-dev \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /

# Upgrade pip and install compatible setuptools
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir setuptools==59.5.0 certifi

# Install Python dependencies
RUN pip install --no-cache-dir \
    dlib==19.24.0 \
    imageio==2.9.0 \
    imgaug==0.4.0 \
    scipy==1.7.3 \
    seaborn==0.11.2 \
    pyyaml==6.0 \
    imutils==0.5.4 \
    opencv-python==4.6.0.66 \
    scikit-image==0.19.2 \
    scikit-learn==1.0.2 \
    efficientnet-pytorch==0.7.1 \
    timm==0.6.12 \
    segmentation-models-pytorch==0.3.2 \
    torchtoolbox==0.1.8.2 \
    tensorboard==2.10.1 \
    loralib \
    pytorchvideo \
    einops \
    transformers \
    filterpy \
    simplejson \
    kornia

# Install OpenAI CLIP
RUN pip install --no-cache-dir \
    git+https://github.com/openai/CLIP.git

ENV MODEL_NAME=deepfakebench

EXPOSE 6000

CMD ["/bin/bash"]