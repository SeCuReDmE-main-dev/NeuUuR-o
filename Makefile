# Define variables
PYTHON = python3
PIP = pip3
DOCKER_COMPOSE = docker-compose

# Define targets
.PHONY: all install build run test clean

# Default target
all: install build run

# Install dependencies
install:
	$(PIP) install -r requirements.txt

# Build Docker images
build:
	$(DOCKER_COMPOSE) build

# Run the services
run:
	$(DOCKER_COMPOSE) up

# Run tests
test:
	$(PYTHON) -m unittest discover -s tests

# Clean up
clean:
	$(DOCKER_COMPOSE) down
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .coverage
	rm -rf coverage.xml
	rm -rf htmlcov
