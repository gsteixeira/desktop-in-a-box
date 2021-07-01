FROM debian:buster

ARG VNCPASS
ENV DEBIAN_FRONTEND noninteractive

# Install the basic system
RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y xvfb x11vnc fluxbox supervisor procps sudo && \
    apt-get --reinstall install -y xfonts-base
# Install some desktop tools
RUN apt-get install -y vim links pcmanfm firefox-esr xfe viewnior chromium
# Setup locales
RUN apt-get install -y locales && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8
# Adds an User and setup vnc
RUN useradd -s /bin/bash -m user && \
    mkdir /home/user/.vnc/ && \
    chown -R user.user /home/user && \
    su user -c "x11vnc -storepasswd $VNCPASS /home/user/.vnc/passwd"
# grand sudo rights
RUN echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
# Copy needed files
ADD tmp/menu /home/user/.fluxbox/menu
ADD etc/ /etc/
RUN chown -R user.user /home/user
RUN mkdir -p /var/run/dbus

EXPOSE 5900

CMD ["/etc/entrypoint.sh"]

