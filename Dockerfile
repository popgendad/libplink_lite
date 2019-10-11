FROM pbwt_hts

RUN apt-get update

RUN mkdir /libplink_lite

ADD . /libplink_lite

WORKDIR /libplink_lite

RUN make && make install

CMD ["/bin/ls", "-l", "/usr/include/libplink_lite.so"]
