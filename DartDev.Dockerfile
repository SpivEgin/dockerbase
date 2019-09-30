#
# ActiveFlyers Dartlang base

# Pull base image.
FROM quay.io/spivegin/tlmbasedebian


# Install Dart.
ENV DART_VERSION 2.6.0-dev.3.0
# https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip
RUN mkdir /opt/dart /opt/dart/code /opt/dart/data /opt/dart/bin /opt/dartlang
RUN apt-get update && apt-get install -y unzip curl git &&\
    cd /opt/dartlang/ && \
    curl -O https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip && \
    unzip dartsdk-linux-x64-release.zip && \
    rm dartsdk-linux-x64-release.zip &&\
    echo "\nexport PATH=/opt/dartlang/dart-sdk/bin:\$PATH" >> /etc/profile &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ENV PATH /opt/dartlang/dart-sdk/bin:$PATH

# Define working directory.
WORKDIR /opt/dart/code

# Define default command.
#CMD ["bash"]
#ENTRYPOINT ["/bin/bash"]