FROM ruby:2.4.3-alpine

WORKDIR /sinatra

ENV BUNDLE_GEMFILE=/sinatra/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle

ADD Gemfile* /sinatra/

RUN bundle install

ADD . /sinatra

EXPOSE 4567

CMD ["rackup", "-p", "4567"]