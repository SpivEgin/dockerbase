FROM quay.io/spivegin/tlmbasedebian


RUN mkdir /opt/golang /opt/tmp /opt/src
ENV GOPATH=/opt/src/ \
    GOBIN=/usr/local/go/bin \
    PATH=/usr/local/go/bin:$PATH \
    GO_VERSION=1.10.3
    
ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/

RUN apt-get update && apt-get install -y unzip curl git &&\
    tar -C /usr/local -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    export PATH=$PATH:/usr/local/go/bin &&\
    export GOPATH=/opt/src/ &&\
    ln -s /usr/local/go/bin/* /bin/ &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ADD https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64 /usr/local/go/bin/dep

RUN apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

