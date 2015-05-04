FROM r-base:latest

MAINTAINER Hendrik Volkmer version: 0.1


COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

RUN Rscript /usr/local/src/myscripts/install.R

CMD ["R"]
