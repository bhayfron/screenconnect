FROM debian:stretch

# Install dependencies
RUN apt-get update
RUN apt-get -y install procps wget

# Clean
RUN rm -rf /var/lib/apt/lists/*

# Prepare directories
RUN mkdir /opt/screenconnect-installer

# Setup
ADD "https://d1kuyuqowve5id.cloudfront.net/ScreenConnect_19.4.25759.7247_Release.tar.gz" /opt/screenconnect-installer/ScreenConnect_19.4.25759.7247_Release.tar.gz
WORKDIR /opt/screenconnect-installer/
RUN tar xvf ScreenConnect_19.4.25759.7247_Release.tar.gz
RUN echo -e "\n\n" | ScreenConnect_*_Install/install.sh

# Volume
VOLUME /opt/

# Ports
EXPOSE 8040 8041

# Command
ADD run.sh /run.sh
WORKDIR /opt/screenconnect
CMD ["/bin/sh", "/run.sh"]
