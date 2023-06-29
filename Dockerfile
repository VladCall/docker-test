FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y docker.io

# Set up the Docker-in-Docker environment
RUN apt-get install -y curl && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

# Set the entrypoint command to start the Docker daemon
ENTRYPOINT service docker start && bash
