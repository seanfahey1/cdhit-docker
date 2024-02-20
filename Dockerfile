FROM ubuntu:jammy

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y build-essential zlib1g-dev wget \
  && apt-get clean && apt-get purge \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt update \
  && apt -y upgrade \
  && apt install -y tree git python3 curl

WORKDIR /usr/src

RUN wget https://github.com/weizhongli/cdhit/releases/download/V4.8.1/cd-hit-v4.8.1-2019-0228.tar.gz \
  && tar xfz cd-hit-v4.8.1-2019-0228.tar.gz \
  && rm cd-hit-v4.8.1-2019-0228.tar.gz \
  && cd cd-hit-v4.8.1-2019-0228 \
  && make \
  && cd cd-hit-auxtools \
  && make

ENV PATH=${PATH}:/usr/src/cd-hit-v4.8.1-2019-0228:/usr/src/cd-hit-v4.8.1-2019-0228/cd-hit-auxtools

CMD bash
