FROM localhost:5000/precise
MAINTAINER Kingdon Barrett <kbarrett@metrixmatrix.com>

ENV HOME /root
RUN mkdir /build
ADD . /build
RUN /build/install.sh
RUN rm /etc/service/nginx/down
CMD ["/sbin/my_init"]
