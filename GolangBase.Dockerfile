FROM quay.io/spivegin/tlmbasedebian


ENV GO_VERSION=1.10
RUN mkdir /opt/golang /opt/tmp /opt/src
ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/
RUN apt-get update && apt-get install -y unzip curl git &&\
    tar -C /usr/local -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    export PATH=$PATH:/usr/local/go/bin &&\
    export GOPATH=/opt/src/ &&\
    ln -s /usr/local/go/bin/* /bin/ &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*


ENV GOPATH=/opt/src/