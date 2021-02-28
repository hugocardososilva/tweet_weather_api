FROM ruby:2.7.0

ENV NODE_VERSION 12
ENV INSTALL_PATH /opt/app

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs postgresql-client \
      locales yarn

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH