############################################################
# Dockerfile to build wview container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Pete Valentine

# Update the repository sources list
RUN apt-get update

################## BEGIN INSTALLATION ######################
# Install wview from deb source
# Ref: http://www.wviewweather.com/release-notes/wview-User-Manual.html#Installation-debian

# Add the package verification key
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

# Add wview to the repository sources list
RUN echo 'deb http://www.wviewweather.com/apt/trusty trusty main' > /etc/apt/sources.list.d/wview.list
RUN echo 'deb-src http://www.wviewweather.com/apt/trusty trusty main' > /etc/apt/sources.list.d/wview.list

# Update the repository sources list once more
RUN apt-get update

# Install wview package (.deb)
RUN apt-get install -y wview

##################### INSTALLATION END #####################

# Expose the default port
EXPOSE 80
EXPOSE 443

# Default port to execute the entrypoint (http)
CMD ["--port 80"]
CMD ["--port 443"]

# Set default container command
ENTRYPOINT /etc/init.d/wview
