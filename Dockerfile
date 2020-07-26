FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /vb
WORKDIR /vb
ADD Gemfile /vb/Gemfile
ADD Gemfile.lock /vb/Gemfile.lock
RUN bundle install
ADD . /vb