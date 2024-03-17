FROM mcr.microsoft.com/devcontainers/python:1-3.10-bookworm

ADD install.sh /
RUN /install.sh

# improve compatibility with amd64 solc in non-amd64 environments (e.g. Docker Desktop on M1 Mac)
ENV QEMU_LD_PREFIX=/usr/x86_64-linux-gnu
RUN if [ ! "$(uname -m)" = "x86_64" ]; then \
  export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y --no-install-recommends libc6-amd64-cross libstdc++6-amd64-cross \
  && rm -rf /var/lib/apt/lists/*; fi

# improve compatibility with CI repo scripts
ENV GITHUB_WORKSPACE=/workspaces/manticore