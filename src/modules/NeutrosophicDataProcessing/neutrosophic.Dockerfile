# Base image with core dependencies
FROM python:3.9-slim as base

# Development image with additional tools
FROM base as dev
RUN pip install pytest black mypy

# Testing image with pytest
FROM dev as test
COPY tests/ /app/tests/
CMD ["pytest", "/app/tests"]

# Neutrosophic core image
FROM base as neutrosophic
COPY neutrosophic%20quantum%20FfeD%20enhancement/core.py /app/
RUN pip install numpy pandas scipy

# Full featured image with all integrations
FROM neutrosophic as cloud
RUN pip install \
    mindsdb[writer,statsforecast,neuralforecast] \
    chromadb \
    sentence-transformers \
    impyla

# Build configuration matrix
target "images" {
  name = item.name
  dockerfile = "docker/neutrosophic.Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
  matrix = {
    item = [
      {
        name = "base"
        target = ""
      },
      {
        name = "dev" 
        target = "dev"
      },
      {
        name = "neutrosophic"
        target = "neutrosophic"
      },
      {
        name = "cloud"
        target = "cloud" 
      }
    ]
  }
  tags = [
    "neutrosophic:${VERSION}-${item.name}",
    "neutrosophic:${item.name}"
  ]
}