FROM osrf/ros:noetic-desktop-full

WORKDIR /root

# Set up the workspace environment
ENV CATKIN_WS=catkin_ws
RUN mkdir -p $CATKIN_WS/src
RUN mkdir repos

# Set environment variables
ENV SHELL=/bin/bash
ENV PATH=/usr/local/bin:$PATH

# Surpress "ROS Noetic goes end-of-life 2025-05-31" warning
ENV DISABLE_ROS1_EOL_WARNINGS=1

# Create XDG runtime directory with proper permissions
RUN mkdir -p /tmp/runtime-root && chmod 0700 /tmp/runtime-root

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    # Install some basic utilities
    git \
    curl \
    cmake \
    wget \
    vim \
    tmux \
    # Install dependencies
    ros-noetic-catkin \
    python3-catkin-tools

# Build catkin
RUN /bin/bash -c "cd $CATKIN_WS && \
    source /opt/ros/$ROS_DISTRO/setup.sh && \
    catkin init && \
    catkin build && \
    source devel/setup.bash"

# Update .bashrc
RUN echo "source /opt/ros/$ROS_DISTRO/setup.sh" >> /root/.bashrc
RUN echo "source /root/$CATKIN_WS/devel/setup.bash" >> /root/.bashrc   