FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
                       yarn     

RUN mkdir /protospace-37445

ENV APP_ROOT /protospace-37445
WORKDIR $APP_ROOT

COPY . /protospace-37445

RUN gem install bundler 
RUN bundle install
