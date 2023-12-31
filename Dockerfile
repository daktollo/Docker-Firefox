# We are going to use the Latest version of CentOS 7
FROM centos:7

# Install necessary packages including firefox and locales
RUN yum update -y && \
    yum install -y firefox dbus-x11 libcanberra-gtk2 glibc-locale-source

# Setting up the default locale to en_US.UTF-8
RUN localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
    export LANG=en_US.UTF-8

# Generating a universally unique ID for the Container
RUN dbus-uuidgen > /etc/machine-id

# Starting Firefox application
CMD /usr/bin/firefox

