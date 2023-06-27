# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/rust/.devcontainer/base.Dockerfile
# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/devcontainers/rust:1-${VARIANT}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y postgresql \
    \
    && rustup update \
    && rustup component add rust-docs \
    \
    # cleanup
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/build \
    && chmod -R a+rw /opt/build

USER ${USERNAME}
RUN cargo install diesel_cli --no-default-features --features postgres
RUN cargo install cargo-watch
