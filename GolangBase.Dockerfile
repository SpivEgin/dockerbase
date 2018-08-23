FROM quay.io/spivegin/tlmbasedebian


RUN mkdir /opt/golang /opt/tmp /opt/src
ENV GOPATH=/opt/src/ \
    GOBIN=/opt/go/bin \
    PATH=/opt/go/bin:$PATH \
    GO_VERSION=1.10.3

ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/
ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /opt/tmp/dep

RUN apt-get update && apt-get install -y unzip curl git &&\
    tar -C /opt/ -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    mv /opt/tmp/dep /opt/go/bin/dep &&\
    chmod +x /opt/go/bin/* &&\
    ln -s /opt/go/bin/* /bin/ &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*