FROM ubuntu:16.04
MAINTAINER Shinya Okano <tokibito@gmail.com>

RUN apt-get update -y && apt-get install -y \
  unzip \
  wget \
  libxml2-dev \
  libxslt1-dev \
  libjpeg8-dev \
  zlib1g-dev \
  build-essential \
  python2.7 \
  python2.7-dev \
  python-pip
RUN pip install -U pip Pillow lxml
RUN wget -q -O /appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip; unzip -q /appengine.zip
RUN wget -q -O /google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-121.0.0-linux-x86_64.tar.gz; tar xzf /google-cloud-sdk.tar.gz
RUN /google-cloud-sdk/install.sh

ENV PATH $PATH:/google_appengine/
WORKDIR "/app"
