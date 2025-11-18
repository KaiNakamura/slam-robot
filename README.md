# SLAM Robot

An autonomous mapping robot that uses SLAM (Simultaneous Localization and Mapping)

## Installation

This repo has been tested on Ubuntu 24.04, but should work on any machine that can run the included Docker container.

It is recommened to install the following (or equivalent for your system):

- [Docker Engine](https://docs.docker.com/engine/install/ubuntu/#installation-methods)
- [Post-install steps](https://docs.docker.com/engine/install/linux-postinstall/) to run Docker as non-root user

## Building

Run this script to set up X11

- If you get permission errors try elevating with `sudo`
- Or try removing any `.docker.xauth` files from the `/tmp` directory manually with `sudo rm -rf /tmp/.docker.xauth*`
- Note that if you see errors later like `glfw error 65544: X11: Failed to open display :1` or `failed to initialize GLFW` you'll need to revisit this step and rebuild the container

```bash
./setup_x11.sh
```

Then build the contianer

```bash
docker compose up -d

# Or to force rebuilding
docker compose up -d --build --force-recreate
```

## Running

Then run the container

```bash
./run_docker.sh
```

Now run `roscore` from within the container.

To run `rviz`, you'll need to open another terminal which can be done from within the container with `tmux`. Or by spinning up another container on a new terminal from your host machine.
