FROM 552622921787.dkr.ecr.us-east-1.amazonaws.com/dnascience/amazonlinux2:latest

ARG NEXT_VERSION

RUN yum --disablerepo amzn2-core makecache

RUN yum install --disablerepo amzn2-core -y gcc make

ADD . /libplink_lite

RUN cd /libplink_lite && \
    make && \
    mkdir -p /tmp/libplink_lite/usr/lib64/ && \
    mkdir -p /tmp/libplink_lite/usr/include/ && \
    echo ${NEXT_VERSION} > VERSION && \
    cp libplink_lite.so /tmp/libplink_lite/usr/lib64/ && \
    cp plink_lite.h /tmp/libplink_lite/usr/include/ && \
    fpm -s dir -t rpm -n libplink-lite -v ${NEXT_VERSION} -C /tmp/libplink_lite -p libplink-lite_VERSION_ARCH.rpm . && \
    mv libplink-lite*.rpm /rpms/
