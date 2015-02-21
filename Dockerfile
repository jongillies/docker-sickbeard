FROM phusion/passenger-customizable:0.9.10
MAINTAINER Jon Gillies <supercoder@gmail.com>

# Cloned from git@github.com:timhaak/docker-sickbeard.git, thanks Tim Haak <tim@haak.co.uk>

ENV SICKBEARD_VERSION master
#ENV SICKBEARD_VERSION build-506

RUN apt-get -q update &&\
    apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes python-cheetah wget tar ca-certificates curl

RUN curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
 tar -xvf sickbeard.tgz -C /  &&\
 mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
 rm  /sickbeard.tgz

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/*

VOLUME /config
VOLUME /data
VOLUME /tv
VOLUME /complete

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

CMD ["/start.sh"]
