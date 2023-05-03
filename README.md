# Docker Test Container

A handy little container with troubleshooting tools.

Currently the container has only been used for network troubleshooting, but it'll probably grow in scope. This is just
a personal sandbox. Fork it if you want, but you probably shouldn't use this directly.

## Getting Started

Install `make` and Docker, then run...

```bash
git clone https://github.com/pcrockett/docker-test-container.git
cd docker-test-container

# This may require `sudo` if you're using Docker on Linux:
make
```

That will start an interactive Bash prompt where you can mess around.
